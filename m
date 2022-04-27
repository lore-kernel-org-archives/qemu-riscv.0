Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njnTB-0003pG-8B
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 15:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiatai2021@iscas.ac.cn>)
 id 1njkRW-00015b-6C; Wed, 27 Apr 2022 12:23:06 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:49916 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jiatai2021@iscas.ac.cn>)
 id 1njkRT-0000D4-GY; Wed, 27 Apr 2022 12:23:05 -0400
Received: from localhost.localdomain (unknown [61.148.244.203])
 by APP-05 (Coremail) with SMTP id zQCowADXXRrLbWliWqd6AQ--.61452S4;
 Thu, 28 Apr 2022 00:22:41 +0800 (CST)
From: Jiatai He <jiatai2021@iscas.ac.cn>
To: liweiwei@iscas.ac.cn
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, lazyparser@gmail.com,
 palmer@dabbelt.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 wangjunqiang@iscas.ac.cn, Jiatai He <jiatai2021@iscas.ac.cn>
Subject: Re: [PATCH] target/riscv: add scalar crypto related extenstion
 strings to isa_string
Date: Thu, 28 Apr 2022 00:22:14 +0800
Message-Id: <20220427162214.6515-1-jiatai2021@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426095204.24142-1-liweiwei@iscas.ac.cn>
References: <20220426095204.24142-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADXXRrLbWliWqd6AQ--.61452S4
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYa7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
 6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
 kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
 cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aV
 CY1x0267AKxVW8JVW8Jr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAa
 Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4
 A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F
 5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r1l42xK82IYc2Ij64vIr41l4I8I3I0E4I
 kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
 WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
 0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW3
 JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
 UvcSsGvfC2KfnxnUUI43ZEXa7VUUy89JUUUUU==
X-Originating-IP: [61.148.244.203]
X-CM-SenderInfo: xmld3trlsqji46lvutnvoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=jiatai2021@iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 27 Apr 2022 15:36:58 -0400
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
X-List-Received-Date: Wed, 27 Apr 2022 16:23:06 -0000

This patch could work successfully in qemu, "zk" could be found in linux device tree.

Tested-by: Jiatai He <jiatai2021@iscas.ac.cn>


