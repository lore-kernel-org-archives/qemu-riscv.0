Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1okMji-000369-5P
	for mharc-qemu-riscv@gnu.org; Mon, 17 Oct 2022 05:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1okMis-0002qb-Gy; Mon, 17 Oct 2022 05:47:55 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:41163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1okMij-00066I-J8; Mon, 17 Oct 2022 05:47:43 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VSLlBov_1666000032; 
Received: from 30.221.97.118(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VSLlBov_1666000032) by smtp.aliyun-inc.com;
 Mon, 17 Oct 2022 17:47:13 +0800
Message-ID: <4672400c-0084-3bf3-a596-7a42115301f0@linux.alibaba.com>
Date: Mon, 17 Oct 2022 17:47:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Question about TCG backend correctness
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.132;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-132.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2022 09:48:17 -0000

Hi folks,

     For TCG front end, we can test it with tools, such as RISU. But I 
don't know if  there are some tools that can help
to verify the correctness of a TCG backend.

     Can someone share the tools or the experience to debug RISC-V 
backend?  Thanks very much.

Best Regards,
Zhiwei


