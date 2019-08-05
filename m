Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hufPe-0000Tl-Qm
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 12:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58372)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPb-0000Jw-PS
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:00:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPa-0002rD-Pa
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:00:39 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40381)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hufPY-0002ov-CC; Mon, 05 Aug 2019 12:00:36 -0400
Received: by mail-pf1-x443.google.com with SMTP id p184so39868568pfp.7;
 Mon, 05 Aug 2019 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=mAXOsVeY+WH0KY8xBsARzSnd6O65X/IHsyEOSBOVcT8=;
 b=H0+kzdn2ynOr4mdwDqm1T+8aiSxGAO/m69ecswYtEGzDvz31/PV652wNaMbYGvDlFX
 7ho9kERGAMF2D8ylS1u+CCNrNA08HPL/8a8FMcMMW+Z4fSTl2qWmGO0bzQAi/wcVo3qP
 Rbozt3Sptg8+bO8jxFNPIuuCQNai4ZhZvhB4VTFzQyP9jixXn7WwsE+IBH2tdxy9R9e9
 SHL8DesEOOE7wf6XeFWgXiqMztgrB4iv8iG2dnEQaEw9ejROB8hp5BM0WFKDGiqLHWyi
 EF9eoOY+tUxePzFWHiefsGSzDvve5mBNGKiFrjCQ/I24DxdHRe9AxfbZNEQQzVIvyc7i
 ykFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=mAXOsVeY+WH0KY8xBsARzSnd6O65X/IHsyEOSBOVcT8=;
 b=WNdyEzh/Jl6reZ1Fa0Mpo2wA6m9rX4iFNKjhZapZjoyJn6Hkgkx+lWrc02JnpDShC/
 ISq3KmUQtm9mE6cntB6bZnJQ8apGg6Z6f8zm9rqaksPkao8RPxJC1iSeCFFo2MO003Nk
 vlTwmBOz1LfNgcL6df/H2soWBRnbpN7dqj6aGCzGajOBCwpPbNcYIXNXf235OnvzLj5V
 hobMGDnRxmeGmMzJCDO+C+d+J0sKl9wifYIgK6+orCopEvJXFjocARSHrolU84dcASFD
 IkDUXwvGxfeF0UkHIdmxU6P4bu6gn2FNs1yTZZ1YdOkfqU+lLxNa5ZQdsvg8yPxNV45i
 iJmA==
X-Gm-Message-State: APjAAAX57hsfkM0VgTrYq97VHPBIm97E5FGGthCZ28AZOSQiElB/I9+k
 z87qPPe1pxmdNkxi+szTPNg=
X-Google-Smtp-Source: APXvYqw690F4kOZkqOpEIydqp4AdUSm2FzWYY96abRvPoE5oTnrCEd25NBduP6fo7AZ+zv+D0r7m0g==
X-Received: by 2002:a62:8643:: with SMTP id x64mr75949694pfd.7.1565020835697; 
 Mon, 05 Aug 2019 09:00:35 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id d18sm47728793pgi.40.2019.08.05.09.00.34
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 05 Aug 2019 09:00:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Mon,  5 Aug 2019 09:00:02 -0700
Message-Id: <1565020823-24223-8-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-riscv] [PATCH 07/28] riscv: sifive_u: Set the minimum number
 of cpus to 2
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
X-List-Received-Date: Mon, 05 Aug 2019 16:00:42 -0000

It is not useful if we only have one management CPU.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/sifive_u.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 08d406f..206eccc 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -428,6 +428,8 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
      * management CPU.
      */
     mc->max_cpus = 5;
+    /* It is not useful if we only have one management CPU */
+    mc->min_cpus = 2;
 }
 
 DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
-- 
2.7.4


