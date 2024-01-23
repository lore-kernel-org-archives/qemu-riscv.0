Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CE7C47258
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 11:12:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rSEgE-0003AS-Op; Tue, 23 Jan 2024 06:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rSEfy-0002nv-9m
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 06:10:45 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rSEfs-0004NP-HG
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 06:10:41 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33929364bdaso2444886f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 23 Jan 2024 03:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706008234; x=1706613034;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sCDXVKioSoKA0NfjKMALDl2Tvtb69LxP0DpxP284A0o=;
 b=knKj+4m4jnxafw8/SRXNYM/aHDWYE9bi24dGWO/mt5zCvaI5Ml+ES8Jia2PrQVS0q8
 Hs7dXYyVKUINS9wSbU2PXlTDiXW6UNQvF5hm3wLyqMwsol9MMUU/RQbhrGKOZjhgd/7F
 GKZDAwgkigEBDwv+CSANtgD9S9KUXIoUP6BWVlWm39zwram8nPg7dhw/p5jY5MLm5yog
 +MOgbkdXy48/Qz/n+L8D/stwYHBvC4ZM/H0v0WZuB6RNinyM0DzU/LAd9gcem/AOdqvd
 VZhiGXoKJs3AMk3Ne1FQI8y7YDFwm2pD0zGWCGaZ+vU6SI8/+wLAG4wO84yLTSF/l50O
 FjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706008234; x=1706613034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sCDXVKioSoKA0NfjKMALDl2Tvtb69LxP0DpxP284A0o=;
 b=E7+c6UArMPXn4OAPUYcG6XN+yCqU4PyeY75v48wlRRSadvEcoByD+SHf0MW8G47KJd
 3mBJu6gnBdclO8GWqmzFhS7oQ2qM2hvug83ueE0WV50Plge8GBCayFQVUPVcOJNMclB4
 xBDgg4CsQmQhDSE/4D11qJVdZ161m5qHTCpbCUQn8zfcN8U3be9CSbyqlNFc2rhv7n6Q
 uBfFIJssJ0USZJ6M3zcOrkDVDclDC8FdJ7UGG4Oye1wp42P/h0WBak/f5BJtSttjCjr8
 FUYnGngUIlZZMxcCmGOWsEO/HLX48bSSgpzHCkaA3F+Q84171tfuzA/kD77BQHV3Al9Y
 JaAA==
X-Gm-Message-State: AOJu0YzDZdUCHDtOWgFXRtZKgi8n0ywnEQGPheL6U8hi735uS+ehS+CH
 HISlll4Fo0OFQi+MC/btAtMAAt1XW21szg/0ruj3KLkb2KIgWXE7pcrB0hpgihg=
X-Google-Smtp-Source: AGHT+IHV/RrF5fWLMHwROfzABbl3BvjiiDxUP+n2rZgY7CqF4wVkzw8UjWkzohsfLuAuinLuvv+1pA==
X-Received: by 2002:a05:6000:1086:b0:337:c8ac:1942 with SMTP id
 y6-20020a056000108600b00337c8ac1942mr3232187wrw.9.1706008234158; 
 Tue, 23 Jan 2024 03:10:34 -0800 (PST)
Received: from rockhopper.. (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d4c4f000000b00337d6f0013esm12288013wrt.107.2024.01.23.03.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 03:10:33 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v3 1/3] target/riscv: Add Zaamo and Zalrsc extension
 infrastructure
Date: Tue, 23 Jan 2024 11:10:28 +0000
Message-ID: <20240123111030.15074-2-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123111030.15074-1-rbradford@rivosinc.com>
References: <20240123111030.15074-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

These extensions represent the atomic operations from A (Zaamo) and the
Load-Reserved/Store-Conditional operations from A (Zalrsc)

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu_cfg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index fea14c275f..cc4c30244c 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -78,7 +78,9 @@ struct RISCVCPUConfig {
     bool ext_svnapot;
     bool ext_svpbmt;
     bool ext_zdinx;
+    bool ext_zaamo;
     bool ext_zacas;
+    bool ext_zalrsc;
     bool ext_zawrs;
     bool ext_zfa;
     bool ext_zfbfmin;
-- 
2.43.0


