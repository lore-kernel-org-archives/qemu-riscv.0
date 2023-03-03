Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0z6-0007sZ-Kg
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z2-0007gv-1q
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:44 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z0-0007tE-EK
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:43 -0500
Received: by mail-pl1-x636.google.com with SMTP id a9so1945302plh.11
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832901;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lW3Uf0KlHT8vG+lzu2lShmAurqfdQqKUZLaTQ/2d9nc=;
 b=tKFzg2u9hnOFYeRVb5TEFWMcTV13Tzvhf5Q7SFQWrx/temYulKmUp2v1Cmy7UPCPyI
 uboCi/yGe0o9BAR531AiIy++IsVWCX2E6PRH01M6MDX4hm3/mrKqFuj2OjWrHpB9AyyS
 lRlbRax6nkPMHr4bjjoIVE43Gb0X4Htk3YCiHLSRTLxDbWhe/ZmokYy8jzFELkPsE5Wi
 2+fl1rP0OJGR0NAWyqygp5h1/YMNUjDNgPNyF/M3IoDxUaAgSNhWpnN9T0PDRXnu/Hk2
 NErpoyA/zS0sj2es0NTeMnG5rvOWF63U2gGqnPBf04pJtJoBESrUbVJxs0p+Ly6uaMtB
 ZaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832901;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lW3Uf0KlHT8vG+lzu2lShmAurqfdQqKUZLaTQ/2d9nc=;
 b=igaXkpwv210aKO4uFAJi2AVGlAyOMIurXl6ncQNFU1D/YPD2VZ/Q/+OYFHQSHLb/eB
 o63Kop4AbNee8w0kc3DC0cXKPu1SOnVqZ07xXcaj5uNOBXizsSbp2yIiM04Yzr8QIqvD
 qCA5QYU1IZeRQ1lUwsxabgE3NbgwzdFdvawimC9cYb7SS6I49JDDrHD424TGpDffN+J5
 6l4+mO+ypx/wpy5Gy25+TOJje6IJeguOhi87sCVa4gge4yu2fG/QgUwaFAhifgmO/hE7
 V12IzxojOeLV17TrB6XGN246UCJz3PxjJ+sRBHRnJyAX2Fa2cpE1Jqx9Ee6MGtEOccii
 qEnQ==
X-Gm-Message-State: AO0yUKX4zVP7tI3AaylRVLWeH5U/HEQQrzXrtGeS/fU167AkgGYZXLh9
 IqO9KemwBE6DTn4u1QMq5Vfvg7hhmfi+2JfS
X-Google-Smtp-Source: AK7set+a3CrsgLLcn7wJGxEvJcTB0nN+aUK9fz+myqVSMo5x5yTrkmr+ez0jcx7d8A7ia++Fm3pHdw==
X-Received: by 2002:a17:90b:4c43:b0:233:c40d:9a37 with SMTP id
 np3-20020a17090b4c4300b00233c40d9a37mr934004pjb.10.1677832900844; 
 Fri, 03 Mar 2023 00:41:40 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 lx3-20020a17090b4b0300b00233bc4edb77sm2900050pjb.25.2023.03.03.00.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:40 -0800 (PST)
Subject: [PULL 16/59] target/riscv: Add property check for Zvfh{min} extensions
Date: Fri,  3 Mar 2023 00:36:57 -0800
Message-Id: <20230303083740.12817-17-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:44 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Add check for Zvfh and Zvfhmin.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-7-liweiwei@iscas.ac.cn>
[Palmer: commit text]
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 49912c9174..49ac368662 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -768,6 +768,20 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_zvfh) {
+        cpu->cfg.ext_zvfhmin = true;
+    }
+
+    if (cpu->cfg.ext_zvfhmin && !cpu->cfg.ext_zve32f) {
+        error_setg(errp, "Zvfh/Zvfhmin extensions require Zve32f extension");
+        return;
+    }
+
+    if (cpu->cfg.ext_zvfh && !cpu->cfg.ext_zfhmin) {
+        error_setg(errp, "Zvfh extensions requires Zfhmin extension");
+        return;
+    }
+
     /* Set the ISA extensions, checks should have happened above */
     if (cpu->cfg.ext_zhinx) {
         cpu->cfg.ext_zhinxmin = true;
-- 
2.39.2


