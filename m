Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lq5dy-0005X2-Sd
	for mharc-qemu-riscv@gnu.org; Sun, 06 Jun 2021 23:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lq5dw-0005WW-1T; Sun, 06 Jun 2021 23:09:36 -0400
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:36621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lq5dt-0001wO-KO; Sun, 06 Jun 2021 23:09:35 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.5697423|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_news_journal|0.137546-0.000811601-0.861643;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KOeW5Sv_1623035361; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KOeW5Sv_1623035361)
 by smtp.aliyun-inc.com(10.147.41.158);
 Mon, 07 Jun 2021 11:09:22 +0800
To: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: TCG op for 32 bit only cpu on qemu-riscv64
Message-ID: <97935519-42c8-71c8-3d87-30aa4cafc909@c-sky.com>
Date: Mon, 7 Jun 2021 11:07:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.173; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-173.mail.aliyun.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) BAYES_20=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 07 Jun 2021 03:09:36 -0000

Hi Alistair,

As I see,  we are moving  on to remove TARGET_RISCV64 macro.

I have some questions:

1) Which tcg op should use when translate an instruction for 32bit cpu. 
The tcg_*_i64, tcg_*_i32 or tcg_*_tl?
I see some API such as gen_get_gpr that are using the tcg_*_tl. But I am 
not sure if it is
right for 32bit cpu.

2) Do we should have a sign-extend 64 bit register(bit 31 as the sign 
bit)  for 32 bit cpu?

Best Regards,
Zhiwei


