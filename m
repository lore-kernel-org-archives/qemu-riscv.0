Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iodt1-0008QP-79
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jan 2020 20:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40394)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1iodsy-0008Mz-LC
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2020 20:42:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1iodsx-0008T8-L8
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2020 20:42:20 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:43212)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1iodsv-0008HV-60; Mon, 06 Jan 2020 20:42:17 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1198329|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.209858-0.00807429-0.782067;
 DS=CONTINUE|ham_news_journal|0.00943224-0.000278512-0.990289;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03300; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.GXacsWy_1578361327; 
Received: from 172.16.31.150(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GXacsWy_1578361327)
 by smtp.aliyun-inc.com(10.147.42.241);
 Tue, 07 Jan 2020 09:42:07 +0800
Subject: Re: [PATCH v3 2/4] RISC-V: configure and turn on vector extension
 from command line
To: Jim Wilson <jimw@sifive.com>, alistair23@gmail.com,
 richard.henderson@linaro.org, chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com
References: <20200103033347.20909-1-zhiwei_liu@c-sky.com>
 <20200103033347.20909-3-zhiwei_liu@c-sky.com>
 <2e85f9fd-c254-5403-43ac-6988c013e319@sifive.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <88b684d8-3718-6673-dd78-afdf22d500be@c-sky.com>
Date: Tue, 7 Jan 2020 09:42:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <2e85f9fd-c254-5403-43ac-6988c013e319@sifive.com>
Content-Type: multipart/alternative;
 boundary="------------8327F7377B8089BE63DF69DE"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jan 2020 01:42:22 -0000

This is a multi-part message in MIME format.
--------------8327F7377B8089BE63DF69DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2020/1/7 5:48, Jim Wilson wrote:
> On 1/2/20 7:33 PM, LIU Zhiwei wrote:
>> +            if (cpu->cfg.vlen > RV_VLEN_MAX) {
>> +                error_setg(errp,
>> +                       "Vector extension VLEN must <= %d", 
>> RV_VLEN_MAX);
>> +                return;
>
> There is no architectural maximum for VLEN.  This is simply an 
> implementation choice so you can use static arrays instead of malloc.  
> I think this error should be reworded to something like "Vector 
> extension implementation only supports VLEN <= %d."
Thanks. It's good to reduce ambiguous.
Zhiwei
> The other errors here are for architecture requirements and are OK.
>
> Jim


--------------8327F7377B8089BE63DF69DE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <div class="moz-cite-prefix">On 2020/1/7 5:48, Jim Wilson wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2e85f9fd-c254-5403-43ac-6988c013e319@sifive.com">On
      1/2/20 7:33 PM, LIU Zhiwei wrote:
      <br>
      <blockquote type="cite">+            if (cpu-&gt;cfg.vlen &gt;
        RV_VLEN_MAX) {
        <br>
        +                error_setg(errp,
        <br>
        +                       "Vector extension VLEN must &lt;= %d",
        RV_VLEN_MAX);
        <br>
        +                return;
        <br>
      </blockquote>
      <br>
      There is no architectural maximum for VLEN.  This is simply an
      implementation choice so you can use static arrays instead of
      malloc.  I think this error should be reworded to something like
      "Vector extension implementation only supports VLEN &lt;= %d."
      <br>
       
    </blockquote>
    Thanks. It's good to reduce ambiguous.<br>
    Zhiwei<br>
    <span style="color: rgb(51, 51, 51); font-family: tahoma, 微软雅黑, 宋体,
      arial, georgia, verdana, helvetica, sans-serif; font-size: 14px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span>
    <blockquote type="cite"
      cite="mid:2e85f9fd-c254-5403-43ac-6988c013e319@sifive.com">The
      other errors here are for architecture requirements and are OK.
      <br>
      <br>
      Jim
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------8327F7377B8089BE63DF69DE--

