Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C49C02181
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 16:50:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taduq-0002Q8-SH; Wed, 22 Jan 2025 11:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1taduo-0002Ng-IY
 for qemu-riscv@nongnu.org; Wed, 22 Jan 2025 11:49:18 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1taduh-000592-Mi
 for qemu-riscv@nongnu.org; Wed, 22 Jan 2025 11:49:16 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso50026335e9.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Jan 2025 08:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1737564549; x=1738169349; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7RZEi63Yghe+1zjwvkle+S0lf9Q+BfLQyYedLPb4N2Q=;
 b=Zck8f9KAUfRd8xHZ6zyyECX/dLBqid6y4YwG5HKiJwjVnvewiCpBG6Nrr55bpsnHFy
 A/nr/GwrpyMVico7m9ONzxYjOXRuZ94d6VrNHjZXBbj4HBD07JXEE+0SmTifqTfAXdCP
 vsc8GtrvWWcFzaYb48sSKR3JTeKH6TfMnEosgdizI3NM3DcqPEtQ027l62xt4GQN1d6e
 B4NXS7zME+TqnDVHAcGofH7H2Dhd9Juzfrh/Vz1RN2Z6MP79XgKAF269Ca2OCX11zLRW
 knAvoCSt5b9pSIRPgaVYiYcgdnAJoZZhK8o5zoH936loKQbeRzgcPeSntGQ1G3VHe/ln
 R68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737564549; x=1738169349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7RZEi63Yghe+1zjwvkle+S0lf9Q+BfLQyYedLPb4N2Q=;
 b=u/bU83AGBfhTvLr3WpeN4Nh9H+zA3noR35DEvpXCJ1ZViDTyhLeEwQI9f1Aa4uDGPO
 h8S4t1iRpUIbPvoW1xsHzaLJ2z5xonu1TZ4Hnx0j85u3RV5qBL+O1BmpoB+ilM+5H7Ag
 tJBYlMSMzNcD1F+AhOEoopZnCXnunE+uQcfTrcuuoN7iz9L35PDK5eOAxDwHKA0Kz1rL
 5flHWD/HNewLlsN6bWmKg6FfUSuFX/wQV66MJbhjEhL83yjNps3JvpUZauS6O9eqVuwG
 cjHT8tMxlmYmQxL+Bu/GhiqeNF6zG8joXTOcRJfI9WMsYx/UBoKEkTXM5kzZ9ytD1Y3m
 VXsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsmj2fQlFTwG9DPCuPQYfp1Pd+YQolSzvP5I6pJ5UUHoMbXiopIFS8NJkvZ7UiaQA8MgHAz3UzZOT4@nongnu.org
X-Gm-Message-State: AOJu0YyImQb3YMTkFYoy+EGbAEm1kVF49663Ji3JojKNnuf7JK5m9YIU
 iIW+LaWFlIrVXnNTfOc2Ln040oLUWiuU5zUMl7F/CGQaR01B/LQ1MyUJwRTd0wI=
X-Gm-Gg: ASbGncukowrCtm06Td7vSFfPfT+WMa3CII581n8eGAreym2LeXmlBtDHz/CSWgFZQb5
 icAwljdxBwCMFt/59e/GwcMeEr7vlTgELn8WUaQt33Tm2PODFuYrjGAwQMXFXVf++bJlzFf2lfd
 ZfPvME+8fW8Np3NuD75XCNO/QHbqkiR3qcs8VRVzZYmneI7dxwjDMvw9uYPqN7J45lfL0nldJ4r
 AtSmPqiU77wIjqffHLXc82ihHUbbpDYbid+0dlLJsHTI1sGQ0fXwT40cAp+dak+a/gAP68ueW8V
 wYmC5ZiJYE70AkMSxAG8pzo7GCGhpi7/Z9o=
X-Google-Smtp-Source: AGHT+IFUSOVLjfnxrmmGmdVz28djxt8HcPnRSH+bM/OfJRn7fMTyVEe7Bbz23IyP96DK7KZmc6iEOQ==
X-Received: by 2002:a05:600c:3c82:b0:434:f623:9fe3 with SMTP id
 5b1f17b1804b1-438913e024emr236827035e9.16.1737564548230; 
 Wed, 22 Jan 2025 08:49:08 -0800 (PST)
Received: from paolo-laptop-amd.sou.embecosm-corp.com ([212.69.42.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b318c059sm32095105e9.8.2025.01.22.08.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 08:49:07 -0800 (PST)
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
Subject: [RFC 0/1 v3] target/riscv: use tcg ops generation to emulate whole
 reg rvv loads/stores.
Date: Wed, 22 Jan 2025 16:49:04 +0000
Message-ID: <20250122164905.13615-1-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.savini@embecosm.com; helo=mail-wm1-x32b.google.com
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

Previous versions:

- RFC v1: https://lore.kernel.org/all/20241218170840.1090473-1-paolo.savini@embecosm.com/
- RFC v2: https://lore.kernel.org/all/20241220153834.16302-1-paolo.savini@embecosm.com/

Thanks Max for the feedback here: https://lore.kernel.org/all/258795e9-4e97-4cd7-949f-24e88d24f25e@sifive.com/

The previous version had the issue that calls to tcg_gen_qemu_[ld/st]_i128 and
tcg_gen_[ld/st]_i128 would not generate 128 bits loads and stores but generated
64-bit pairs of loads/stores. This meant that with a trap on the second load/store
we weren't able to increment vstart in ldst_whole_trans by the number of elements
processed by the first 64 bits load/store.

I propose here the following fixes:

- Split the emulation of whole register loads/stores into smaller sizes:
  we generate at best pairs of 64 bits loads/stores anyway so we'd rather call
  directly for the generation of 64 bits load/store operations and update vstart
  accordingly, instead of calling for 128 bits loads and store that under the
  hood will be split.
- Emulate whole register loads/stores by 32 bits blocks for hosts with 32 bits
  registers: this is done again to avoid a splitting of the load or store that
  we want to generate without us being able to set vstart correctly in case a
  trap happens.
- Don't generate 32 bits loads/stores but fall back to the helper function
  if the host has 32 bits registers and we are loading/storing vector elements
  of 64 bits. This is done in order to avoid that a trap stops the execution
  mid-element.

The patch also adds a set of conditions for the use of tcg nodes or helper
function that is host architecture specific.
We observed a performance gain on all the combinations of vector length,
element size and number of fields in the emulation of the whole register loads
and stores apart from a few cases where the helper function pefroms better.
We add a set of condition that cover those cases and future strings can be added
if other architectures require them.

The commit message changed to better reflect the new behaviour of the patch.

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

 target/riscv/insn_trans/trans_rvv.c.inc | 164 +++++++++++++++++-------
 1 file changed, 119 insertions(+), 45 deletions(-)

-- 
2.34.1

