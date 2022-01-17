Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9S81-0001wt-Eq
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 08:32:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5a-0001OX-E7
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:27 -0500
Received: from [2607:f8b0:4864:20::631] (port=39449
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5V-00012X-TU
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:24 -0500
Received: by mail-pl1-x631.google.com with SMTP id c6so12788815plh.6
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 05:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E5KywehhW+LFtSyAdk7dOMvOyCasUk5k/8EijDUesrA=;
 b=tgH9gvV2iv7HrcAPhTFo6vmyJt7EYdeFdsobxyC9g+LScFe3Bg7ZXha/a19TiMj3Qt
 Avw+uwi7En0vIRYE0IXwNF31bpAxWbpOkXEDCoMalclsSoABV0hAnQdK4laoxPApZeTg
 IZIfwyCjolJc7sasIh01B9Ut9huJKvKWtpJ6nRnWg6VtP4W3BlJaxiQ8KM2iH/4bUjZI
 MEecaDJwf6xTWoV84XmrHmr9E9h6f2zFjbw9IbUqGCQ2VjzoK69iEOSofIoN1LgocwaE
 g3ObRUESCs5iJgnl8hSkTW55gxHVrxFswPl5ZtDg0U5DLwBoyXQttcBD5xXIFd0yfcaY
 UkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E5KywehhW+LFtSyAdk7dOMvOyCasUk5k/8EijDUesrA=;
 b=f+/tRUYdmR8D2CFnPVsyEf8Y6iaS1MRtwAge4wP8WMOhdBjfB9hMfZa1N6IwQykg8b
 buw3z0tXIWOj8/e6qHXaviG2yWvdm8JrDlJU3IVF0yv7byXnBmnHUufj5gttWNJ125jB
 wg+hUcWh5vor4i1fwbQ08uEzYxaujxOc0Ygdwuw3w/4np33ZBbfbDY3ygq5AUAhLvn1Y
 drv657+m38tM761Knj8Q0sdi4YLS61Ah5BLTD4r6aLPluwYIiaRaoHhujsxX1kZeqcc9
 e+tGP4OnWwvTsM0i5wARCNVktBZaiFhQO+i+ZrlGDV09x4bT4fiow3Oi/QoOQX9bpWdA
 P15Q==
X-Gm-Message-State: AOAM5315y7L1SPJm1amKOFNaw/Bd7PGdl4+dbygF27dNFCpcn/GZ9vSL
 6+dO9EyE3u4DejKM0zcH5njQCQ==
X-Google-Smtp-Source: ABdhPJwqZzB3amuPIz1FkyaatCIUeHr3Q5ZIaQ68Q7aHoq+9TvxRQqLwrBipVrTValJipycKOD3o5g==
X-Received: by 2002:a17:90b:4b83:: with SMTP id
 lr3mr25830254pjb.59.1642426220666; 
 Mon, 17 Jan 2022 05:30:20 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:30:19 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 16/23] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Mon, 17 Jan 2022 18:58:19 +0530
Message-Id: <20220117132826.426418-17-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jan 2022 13:30:30 -0000

From: Anup Patel <anup.patel@wdc.com>

We should use the AIA INTC compatible string in the CPU INTC
DT nodes when the CPUs support AIA feature. This will allow
Linux INTC driver to use AIA local interrupt CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/virt.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3af074148e..720641b1dd 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -211,8 +211,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         qemu_fdt_add_subnode(mc->fdt, intc_name);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
             intc_phandles[cpu]);
-        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
-            "riscv,cpu-intc");
+        if (riscv_feature(&s->soc[socket].harts[cpu].env,
+                          RISCV_FEATURE_AIA)) {
+            static const char * const compat[2] = {
+                "riscv,cpu-intc-aia", "riscv,cpu-intc"
+            };
+            qemu_fdt_setprop_string_array(mc->fdt, intc_name, "compatible",
+                                      (char **)&compat, ARRAY_SIZE(compat));
+        } else {
+            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
+                "riscv,cpu-intc");
+        }
         qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
 
-- 
2.25.1


