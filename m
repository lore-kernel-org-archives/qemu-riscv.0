Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0z2-0007kn-L7
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yz-0007WZ-QL
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:41 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yy-0007sG-6a
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:41 -0500
Received: by mail-pj1-x102f.google.com with SMTP id y2so1790513pjg.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832898;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E2uTMnecgdqwtCVcnTwCqTOoQw2CLDtGHhwqfs8rN5Y=;
 b=nOByMZlfUE+3wYpRTD2WQ0zfJQvWJEtBmdP3X8qn+3yNeyCYl8MY54sjvwEUubiIeD
 CZIoDDcLRJ1KylGpULcO7EHnxuk9DAPw/G5uR+KSyL63lQUC7eW1HwHJie3+2RH2AQTl
 lqzanUuDe6obwgYedvNSQ9KuSz60J+VtwB0k3tkvR/8TNekvcKHfAE9H8pAh87cSATj/
 v1V6p1FIpQmgyf8kbSN6QZs0r0w6ciMuvvsxp8Gls4kyPiR/z4w9mXZfP2Py1lQfSTlB
 J6Qs/HvXa//vQeJ99WR2QqNmXiCGvppIgUdPoyIlQkQPODWORn2pCPNDAzkN8mxGs7om
 eeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832898;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E2uTMnecgdqwtCVcnTwCqTOoQw2CLDtGHhwqfs8rN5Y=;
 b=qfqCBECFTPR7sFJ1bl+O6lxJeP0pAwOQuPYrHcx6ciFJCEozFKPLjo1tua8glrmld1
 wsgq7eMAFLBCMiGcyXfxIXRymOWcwAgULukSAoxtyHtKng7wYksB6u4JuehVdwAjiTQ3
 6cKvgGT3IOscngDDDDa/r96cjjKcB6lzbkE93d/kZRK662WTrf9rBwKDNDpw70ciQ6mB
 xkdratbNzJ56z6STV1ZVS8sTQu9C7+WkyL+089/ZVzdwckJJIF5SVLPtNHOrFqneytBJ
 vTOAqdeQpqX9Y1dumOk49HEXBtLV0LmhjUpqq7XiWfSQ+WPck9EHanfP7/7ADE0tqPKa
 j4LA==
X-Gm-Message-State: AO0yUKXXbnBQENQSizUomeWO5CxSau/RY84uJcFJpwJTRv1u6kCL50hT
 KZ9HTKrVCvqdjRAV8TkNVPGTGZ7nbXKVByZf
X-Google-Smtp-Source: AK7set/CnTo1KPFRpz3pbg8Tes8k0/Cs7AyRXYoU+gzf6Y9pqPZ3HvJqO3pmKPaB9xTPQNb/yeRDCA==
X-Received: by 2002:a05:6a20:7785:b0:c7:13be:6de9 with SMTP id
 c5-20020a056a20778500b000c713be6de9mr1258284pzg.14.1677832898510; 
 Fri, 03 Mar 2023 00:41:38 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 m8-20020aa79008000000b005dae7d1b61asm1021857pfo.154.2023.03.03.00.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:38 -0800 (PST)
Subject: [PULL 14/59] target/riscv: Add cfg properties for Zv* extensions
Date: Fri,  3 Mar 2023 00:36:55 -0800
Message-Id: <20230303083740.12817-15-palmer@rivosinc.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:42 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Add properties for Zve64d,Zvfh,Zvfhmin extensions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-5-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 31537fc05f..7f5264e165 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -462,7 +462,10 @@ struct RISCVCPUConfig {
     bool ext_zhinxmin;
     bool ext_zve32f;
     bool ext_zve64f;
+    bool ext_zve64d;
     bool ext_zmmul;
+    bool ext_zvfh;
+    bool ext_zvfhmin;
     bool ext_smaia;
     bool ext_ssaia;
     bool ext_sscofpmf;
-- 
2.39.2


