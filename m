Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppqnn-0001XV-Tp
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 09:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnm-0001Uc-64
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:27:50 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnk-0003ru-Lq
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:27:49 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-38ded2d8bcaso1199325b6e.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682083667; x=1684675667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=so/m75aYooy9potUy+9ZNYMFx5vS3f2yXi5Fn9XUP94=;
 b=ggVDW9GslUuTwRsSC4F9jFfYtVaz9s84MDuD1qnmfWaj03GTMAQvpWV/7wUCKoy6m/
 Yawjik58XnF3wVu3KDKTDs3spU1Fx7+qfTV/GxzWWy2B0NVfjn80qEP4j13v4Ac3yDiz
 2DAyUDqdWT7+ZFLkqwY2H+FX9ZXZrUcqtHMSPHfDn9ImxaT3TVphYySmJ10NYX53+ymI
 QBLf2pAvZ5IzGuNwSN2fE7BCsPcT95z/rp7WLOl3tujia114BVI9egVQghcbx4lMwNcE
 3UGnozPsH9ClQUlfuZda139MJN6WNER6L0PWiSqtwMOxl8maVcjsRRjnelvwTq8sP8EY
 BaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083667; x=1684675667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=so/m75aYooy9potUy+9ZNYMFx5vS3f2yXi5Fn9XUP94=;
 b=Hj14GxCt1fhGsRPpPOhvWH5pBUvCERfgo5/KkiocsKe8OSsYQn1sR5oWdv1AtpsjBp
 vyrFbEFpqCprmJTGQPSilcu29Xb5KrtFOjGDl8q+bgl5UhUfopFpP/UaxBPafT9P8z6K
 hNsOoh4WUphjg/uaucsv9tULDasa2S08qi0o28cgvX478t/Vgxfvidb8VVVRDnZigflN
 M8G5IR9K7OxcZWA6nNpnTTfhSr2qRQhCjDYHlx09VITDdXV650EuGwxb/6PxhqZeOC6p
 9mct/w6wmtoZwLOvrgpTmYp3deBbU/91y7h7axIQQImT06rpgMdlcNKdclb/ImNQCYZE
 wOZw==
X-Gm-Message-State: AAQBX9eOmjSN8Vj/zKYww6g3cg9wf6k9POn9wT+86Q+/SD13bvnxC4nQ
 GQRqcU+0s+7/6P5yvXFzvbC5SQ==
X-Google-Smtp-Source: AKy350aqTGHfFFbK+ggBvg7sRDTSoVxVdq5Y/HcbVct/A+GutIlvqn9uDKtSfU6NJRBQxCIxYhghdQ==
X-Received: by 2002:a54:4e0b:0:b0:37b:8502:4c89 with SMTP id
 a11-20020a544e0b000000b0037b85024c89mr2259567oiy.18.1682083667743; 
 Fri, 21 Apr 2023 06:27:47 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 r84-20020acada57000000b003895430852dsm1623359oig.54.2023.04.21.06.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:27:47 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 05/11] target/riscv: Mask the implicitly enabled extensions
 in isa_string based on priv version
Date: Fri, 21 Apr 2023 10:27:21 -0300
Message-Id: <20230421132727.121462-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421132727.121462-1-dbarboza@ventanamicro.com>
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 Apr 2023 13:27:50 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Using implicitly enabled extensions such as Zca/Zcf/Zcd instead of their
super extensions can simplify the extension related check. However, they
may have higher priv version than their super extensions. So we should mask
them in the isa_string based on priv version to make them invisible to user
if the specified priv version is lower than their minimal priv version.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dd35cf378f..9bb0e6b180 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1721,7 +1721,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+        if (cpu->env.priv_ver >= isa_edata_arr[i].min_version &&
+            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.40.0


