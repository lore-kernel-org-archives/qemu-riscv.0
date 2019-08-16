Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyT5C-0004CV-8x
	for mharc-qemu-riscv@gnu.org; Thu, 15 Aug 2019 23:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1hyT5A-0004BZ-7n
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 23:39:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1hyT59-0002ac-9O
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 23:39:16 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:53199)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1hyT56-0002SY-Pd; Thu, 15 Aug 2019 23:39:13 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2986636|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.125584-0.014057-0.860359; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03311; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=6; RT=6; SR=0;
 TI=SMTPD_---.FD.wW7F_1565926740; 
Received: from 172.16.28.187(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.FD.wW7F_1565926740) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 16 Aug 2019 11:39:03 +0800
To: Palmer Dabbelt <palmer@sifive.com>
From: liuzhiwei <zhiwei_liu@c-sky.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Message-ID: <0141541d-43ff-98d8-e9d4-4a2fdcfdcf36@c-sky.com>
Date: Fri, 16 Aug 2019 11:34:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------344DB7DF2CCC4E88C71BF60A"
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 121.197.200.217
Subject: [Qemu-riscv] RISCV: when will the CLIC be ready?
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
X-List-Received-Date: Fri, 16 Aug 2019 03:39:17 -0000

This is a multi-part message in MIME format.
--------------344DB7DF2CCC4E88C71BF60A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Palmer

When Michael Clark still was the maintainer of RISCV QEMU, he wrote in the mail list, "the CLIC interrupt controller is under testing,
and will be included in QEMU 3.1 or 3.2". It is pity that the CLIC is not in
included even in QEMU 4.1.0.

As we have cpus using CLIC, I have to use the out of tree qemu code in SIFIVE
a long time. Could you tell me when it will be upstreamed?

Best Regards
Zhiwei


--------------344DB7DF2CCC4E88C71BF60A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre>Hi, Palmer

When Michael Clark still was the maintainer of RISCV QEMU, he wrote in the mail list, "the CLIC interrupt controller is under testing,
and will be included in QEMU 3.1 or 3.2". It is pity that the CLIC is not in
included even in QEMU 4.1.0. 

As we have cpus using CLIC, I have to use the out of tree qemu code in SIFIVE
a long time. Could you tell me when it will be upstreamed?

Best Regards
Zhiwei
</pre>
  </body>
</html>

--------------344DB7DF2CCC4E88C71BF60A--

