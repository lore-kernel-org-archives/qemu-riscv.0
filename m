Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS7BX-0001SC-BS
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 21:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pS7BS-0001Oc-Rs; Tue, 14 Feb 2023 21:06:10 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pS7BJ-0000DZ-Uo; Tue, 14 Feb 2023 21:06:10 -0500
Received: from localhost.localdomain (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowABXcNT4PexjNkcoBQ--.2339S2;
 Wed, 15 Feb 2023 10:05:45 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 00/14] target/riscv: Some updates to float point related
 extensions
Date: Wed, 15 Feb 2023 10:05:25 +0800
Message-Id: <20230215020539.4788-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABXcNT4PexjNkcoBQ--.2339S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tryxCF45uFW3JFyUGw4xtFb_yoW8WrWkpr
 4fK3y3AFZ5JrZFyr4SqF4UCw15XFs5Wr43A3Z7Aw1rJa13ZrWYqrnrK3WfGFyUJFWrG342
 9F1UCw13Zw47JF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
 628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
 GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
 6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 XdbUUUUUU==
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Feb 2023 02:06:11 -0000

Specification for Zv* extensions can be found in:

https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc

The port is available here:
https://github.com/plctlab/plct-qemu/tree/plct-zvfh-upstream-v2

v2:

* improve the error message for vector related check suggested by Daniel Henrique Barboza in patch 5
* add similar simplification for check in csr.c/cpu_helper.c in patch 8
* fix typos in commit messages


Weiwei Li (14):
  target/riscv: Fix the relationship between Zfhmin and Zfh
  target/riscv: Fix the relationship between Zhinxmin and Zhinx
  target/riscv: Simplify the check for Zfhmin and Zhinxmin
  target/riscv: Add cfg properties for Zv* extensions
  target/riscv: Fix relationship between V, Zve*, F and  D
  target/riscv: Add propertie check for Zvfh{min} extensions
  target/riscv: Indent fixes in cpu.c
  target/riscv: Simplify check for Zve32f and Zve64f
  target/riscv: Replace check for F/D to Zve32f/Zve64d in
    trans_rvv.c.inc
  target/riscv: Remove rebundunt check for zve32f and zve64f
  target/riscv: Add support for Zvfh/zvfhmin extensions
  target/riscv: Fix check for vector load/store instructions when EEW=64
  target/riscv: Simplify check for EEW = 64 in trans_rvv.c.inc
  target/riscv: Expose properties for Zv* extensions

 target/riscv/cpu.c                        |  99 ++++++++----
 target/riscv/cpu.h                        |   3 +
 target/riscv/cpu_helper.c                 |   2 +-
 target/riscv/csr.c                        |   3 +-
 target/riscv/insn_trans/trans_rvv.c.inc   | 184 +++++++---------------
 target/riscv/insn_trans/trans_rvzfh.c.inc |  25 ++-
 6 files changed, 146 insertions(+), 170 deletions(-)

-- 
2.25.1


