Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nrgV4-0006y4-Kd
	for mharc-qemu-riscv@gnu.org; Thu, 19 May 2022 09:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiatai2021@iscas.ac.cn>)
 id 1nrgV1-0006w3-VN; Thu, 19 May 2022 09:47:31 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:53778 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jiatai2021@iscas.ac.cn>)
 id 1nrgUy-0008TX-Tu; Thu, 19 May 2022 09:47:31 -0400
Received: from localhost.localdomain (unknown [114.245.39.10])
 by APP-05 (Coremail) with SMTP id zQCowABnbJBaSoZi2bIICQ--.50751S4;
 Thu, 19 May 2022 21:47:15 +0800 (CST)
From: Jiatai He <jiatai2021@iscas.ac.cn>
To: i@zenithal.me
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 palmer@dabbelt.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Jiatai He <jiatai2021@iscas.ac.cn>
Subject: Re: [PATCH] target/riscv: add zicsr/zifencei to isa_string
Date: Thu, 19 May 2022 21:46:35 +0800
Message-Id: <20220519134635.12541-1-jiatai2021@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YoTqwpfrodveJ7CR@Sun>
References: <YoTqwpfrodveJ7CR@Sun>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABnbJBaSoZi2bIICQ--.50751S4
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYF7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
 6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
 kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
 cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2js
 IEc7CjxVAFwI0_GcCE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAa
 Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4
 A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F
 5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
 1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
 14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
 IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
 x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
 UI43ZEXa7VUbHa0DUUUUU==
X-Originating-IP: [114.245.39.10]
X-CM-SenderInfo: xmld3trlsqji46lvutnvoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=jiatai2021@iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 19 May 2022 13:47:32 -0000

This patch could work successfully in qemu. With command "cat /proc/device-tree/cpus/cpu@0/riscv\,isa", string "zicsr" and "zifencei" could be found in linux device tree.

Tested-by: Jiatai He <jiatai2021@iscas.ac.cn>


