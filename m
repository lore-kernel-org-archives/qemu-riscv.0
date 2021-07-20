Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m5gdB-0003S6-AO
	for mharc-qemu-riscv@gnu.org; Mon, 19 Jul 2021 23:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1m5gd8-0003Rl-ME; Mon, 19 Jul 2021 23:41:14 -0400
Received: from out28-171.mail.aliyun.com ([115.124.28.171]:54975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1m5gd5-0007wF-Me; Mon, 19 Jul 2021 23:41:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3770881|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_news_journal|0.248622-0.000875485-0.750503;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=4; RT=4; SR=0; TI=SMTPD_---.KlwrMO6_1626752460; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KlwrMO6_1626752460)
 by smtp.aliyun-inc.com(10.147.40.200);
 Tue, 20 Jul 2021 11:41:00 +0800
To: richard.henderson@linaro.org,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: 
Subject: Re:[PATCH 02/17] target/riscv: Introduce gpr_src, gpr_dst
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <e100b406-43e4-df0c-e895-4b4b6fa99ec2@c-sky.com>
Date: Tue, 20 Jul 2021 11:37:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.171; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-171.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 20 Jul 2021 03:41:15 -0000

Hi Richard,

Notice gen_arith is also used by trans_div.  We will modify the source 
register for div instruction after this patch set.

Thanks,
Zhiwei


