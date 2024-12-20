Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641DCE77188
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:39:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tOf5Q-0004KG-0x; Fri, 20 Dec 2024 10:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tOf5O-0004ID-4i
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 10:38:42 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1tOf5L-0002dG-VZ
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2024 10:38:41 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a68480164so340957566b.3
 for <qemu-riscv@nongnu.org>; Fri, 20 Dec 2024 07:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1734709118; x=1735313918; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rnSZSqmkW6r0k76teM39+q6EL/vAX5wA0qnZc2Ee4Lw=;
 b=ZfzMKFi/qCnbaBN5jfl3peBNi+k23EmRGmbm4wq0Y7wNq90z0aei2A4FM4I4z4Q44J
 ZjgKVsD/X/TQ+RIubcYNWcIuPpu2vIALFU84Bfl7xQmEiFndSI/L58hsu12A0nidMzpF
 sWN7UMGUTwlY8n4B14dlENeHqESERjq4mFAlaYJNmCWDPZcnapHJPP6Sqq/kzX/3nACu
 sv4k6l9lvwzjXiA1Sh/PfaKpJxOymi1GOkExgOKXYyW9AjwQmNra1pN343KEpJldErhq
 DJ15FmvAkXlIgfeETZ+Rce64c4v0+pxKuAtHuhiyzwNE+kGBw4raiTi/kf/ynj9pTruU
 GXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734709118; x=1735313918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rnSZSqmkW6r0k76teM39+q6EL/vAX5wA0qnZc2Ee4Lw=;
 b=eP+pCfWirkt59xu08EK3oVacAjaqaufdqCfkZSs2idQMTowPEQRnvil4NyLqtrv4wq
 AaVuMAQbzIhysB8zEevYn6zPV8USQFpynlbFsKgMeRJcpDs4HlzjDJ1IjD25e1+Zg7g1
 ppF+TqHcodjjESnCZFF76CLv5KsuFnPTbMB6rQku5ZQa2ADKdli4NjOmqco8ez6jZlsj
 HTSvF94AWjX3ZdrdTFkgvVGkr6UUnsrDeQM6l0bCFyPLUx44dCGOrleKwupfLPoHwHZu
 nTtng2Q9zt8Vx70a6ewxVQVqL631liEtbSvBTXx7Ct9UDd9MjULItO+mcZOtZbJSzU58
 Qf5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM9DugM767YGAHNWBvwCNKeQJKpPxSXLTb2XXaTn7TTXII96rV69B9bCrpiCARe10t9C3o2d92z0iV@nongnu.org
X-Gm-Message-State: AOJu0Yzrh/mhI0QC53EO4RQvjZrQkYyN8RVmtWbvlslm5NqGuiNpB/Ua
 wIXMzBCdMLnXMcRTDuBBGVtqLwRh7G3IszS/QswZBOOUU/K0oi36vwDlHikirszXcCWFQT5VgJR
 h5+nTgg==
X-Gm-Gg: ASbGnct34ojvSxE+z9sMpir9XoT5AMfC5m5hZbdKIpCb3VNHzysRQx7W9xTkwwGoY+a
 Medpx1w7VTHGugl5qD4NvNFO5OlC/R8LTLi5sCdpIEh9FXyp3QaDZuvXQwZFDcdxyr4uwOXXyKb
 DmFYWKgg86POG6iqYgqewhJCdCCHzhLAf/RNcG7FuL29xZHS1MeAlXRdmi+GtJTOIfM6Nc3tRzF
 xoqlhX5rXihhu58HViRcsqhiQefTVKf/UljpacXIQ+8Sawez5AEZNAavRItw0TIUEY1k5Os4Olc
 1/iAw4Op2kS5Z64Xt6+osc/oIxr4NxABeSaRvLk/3hE=
X-Google-Smtp-Source: AGHT+IH9jji0IHkuuBuY9E/+8fCm39atyg2nLivAdgYbyUTqTwd4RTAyz4jsOx9TqMg8NsEt2ov3yQ==
X-Received: by 2002:a17:907:6e89:b0:aa6:538e:a311 with SMTP id
 a640c23a62f3a-aac2b28eee7mr328656466b.18.1734709117973; 
 Fri, 20 Dec 2024 07:38:37 -0800 (PST)
Received: from paolo-laptop-amd.station (mob-109-118-46-116.net.vodafone.it.
 [109.118.46.116]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe4b85sm186371666b.118.2024.12.20.07.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 07:38:37 -0800 (PST)
From: Paolo Savini <paolo.savini@embecosm.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Savini <paolo.savini@embecosm.com>,
 Richard Handerson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>,
 Jeremy Bennett <jeremy.bennett@embecosm.com>,
 Craig Blackmore <craig.blackmore@embecosm.com>
Subject: [RFC 0/1 v2] target/riscv: use tcg ops generation to emulate whole
 reg rvv loads/stores.
Date: Fri, 20 Dec 2024 15:38:33 +0000
Message-ID: <20241220153834.16302-1-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.savini@embecosm.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Apologies, resending with the right headers.

Following the reviews on the previous version:

- RFC v1: https://lore.kernel.org/all/20241218170840.1090473-1-paolo.savini@embecosm.com/
- Review: https://lore.kernel.org/all/e8fb908d-4723-417a-bf88-b4050432ddad@linaro.org/

we apply the following fixes:

- Fall back to using the helper function if vstart != 0 at the beginning
  of the iterations and refactor the setting of the function arguments
  accordignly.
- Add mark_vs_dirty before performing the memory operations.
- Loosen the atomicity constraints and apply only MO_ATOM_IFALIGN_PAIR
  for element sizes MO_16, MO_32 and MO_64.
- Change the way we update vstart in order to set vstart to 0 if it's the last
  iteration.
- Fix the indentation.

We also rephrase the commit message to better reflect the new behaviour of the
patch.

Many thanks Richard for the thorough review and explanations.

Cc: Richard Handerson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bmeng.cn@gmail.com>
Cc: Weiwei Li <liwei1518@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Helene Chelin <helene.chelin@embecosm.com>
Cc: Nathan Egge <negge@google.com>
Cc: Max Chou <max.chou@sifive.com>
Cc: Jeremy Bennett <jeremy.bennett@embecosm.com>
Cc: Craig Blackmore <craig.blackmore@embecosm.com>


Paolo Savini (1):
  target/riscv: use tcg ops generation to emulate whole reg rvv
    loads/stores.

 target/riscv/insn_trans/trans_rvv.c.inc | 125 +++++++++++++++---------
 1 file changed, 78 insertions(+), 47 deletions(-)

-- 
2.34.1

