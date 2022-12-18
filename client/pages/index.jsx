import Head from 'next/head'
import Image from 'next/image'
import Header from '../components/Header.js'
import Main from '../components/Main.js'

const style = {
  wrapper: `h-screen max-h-screen h-min-screen w-screen bg-[#00072c] text-white select-none flex flex-col justify-between`,
}

export default function Home() {
  return (
    <div className={style.wrapper}>
      <Header />
      <Main />
      <h2>Transaction History</h2>
    </div>
  )
}
