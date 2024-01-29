import test from 'node:test'
import assert from 'node:assert'
import { readFileSync } from 'node:fs'
import yaml from 'js-yaml'

const data = yaml.load(readFileSync('data.yml', 'utf8'))
test('states', () => {
  const states = ['red', 'yellow', 'green']
  for (const kind of ['regular', 'project', 'standby', 'consultation', 'probono', 'colleague']) {
    assert(states.includes(data[kind]), `${kind} has state`)
  }
})

test('rate', () => {
  assert.equal(typeof data.rate, 'string')
  assert(data.rate.length > 0)
  assert(data.rate.includes('$'))
  assert(data.rate.includes('USD'))
})
