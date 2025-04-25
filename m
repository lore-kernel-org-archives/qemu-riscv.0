Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EBFC369C2
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 16:51:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8MGe-0006Px-0z; Fri, 25 Apr 2025 12:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u8MGT-0006L2-IX
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 12:51:01 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u8MGQ-0006xP-W3
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 12:51:00 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-227914acd20so31530105ad.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745599857; x=1746204657; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DjBezA6rw6kjbWq+raeDJ4udUADeZB6guIKyj/zwrZk=;
 b=I8CiU+edSuJo9RQXHNIAbM8Vhb8/3FHa7piyMQP7O5TyDfJT49YJhidlEUI986Qwhj
 TuHjcLF03toE4sJa1ktxJdnGlYOCp5978SLP8GHSEsoTsLclCwb+MlzSklE1l6CcyJwo
 n7BvrUwPofYRqAnCvqm7zgmE8mOO3wlzNfdSrQAXOR/T9uhoHSmmPmB5IcgChDyborGM
 5hj8s931Ovn9zM+5xpRamUyd1vbvBYVD+gTlMujpjwi00YroQYg1RMgf/nNhKTck0Utm
 QPUDOu+mjeOd6L8YOPsrWA+U/SSojyFv0jN2NBxnQqDimgEhO0SUNLovI+Fc37SqmwCm
 GdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745599857; x=1746204657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DjBezA6rw6kjbWq+raeDJ4udUADeZB6guIKyj/zwrZk=;
 b=iJQFcRF3ImlJIIISaGPFKxnSRk/RaSTz3JqHylOOehpCC4aiPm66mI2WIRagCGsGIY
 09DcAr2/MsJS0XtRzLD+PL6gHcDL31xiPr0XIhV6uX81A53wsYHMaAbB4BxUK41VPgRH
 C7ECDe3g9am52ljoNIt7bJKmrKY/mgx67u2DHrVlqcAlso6s+10SskbUHBFklyqhcYB8
 nyf0nrc/cdttcP3UKVBEWTXs6m+ORWWrxOqSBJZBHZA3V1bOmRTyu5erqjfvQC75iOV3
 FPhS5LtZhw4A5E4n45791B3iMnapl0rn/fZY+5OuzYdq81/GpYCA/i1gjenLWqOFGHbS
 uPwQ==
X-Gm-Message-State: AOJu0YzSgUdlOFLbPVhvEPgztjoNnNiWUvcPmh7LKzkFjIkmBFylYbOc
 eqzQgzRjdDv35CUhXJTBVZ8RuZcCFDpPGXYOhQcbn+ytMK9Fb3uQpAk2/BnDCe0=
X-Gm-Gg: ASbGncvNxUkXWQ8M5kBSJI0j3mN/OxMBKfQrfNMFAAK/z8AEYolo5JWadT5WCT3+tAV
 z2S8FtDplU+zctXqa9rKDiIwZ/2VYXKPmMeIuXQHnXPVmmkAp6Fb6FFMBJaW1RRPzy69oxUVyop
 JdNl4Oam8eMiKNr454HJ5Ff9uUfi+n7n9dE2N1um3ZG3SCaaWiMp8oWFRMbhBihG/LbH4KhW8O2
 oGuTpop0EAEWwNPr1H7jK22saxetDzQuPf+ChJOwLkXR8EHq5zGfm7QiYsCVJOvFRzaahP2md9t
 UJ1ASm9y1XtTb5yMwWAVOR2CDcmIBvDBsCo6i8c36ztyHs+aSlV8bDiXpPFZ71/m1SQntr+zdUs
 =
X-Google-Smtp-Source: AGHT+IGfSEs1m56QRJGfHSVujaL7xQ0KH+3oSWR6qchBgWeCzaU8WBBFqk1HmEthmRG1asnEk/+5+A==
X-Received: by 2002:a17:902:ebd2:b0:223:fb95:b019 with SMTP id
 d9443c01a7336-22db49988a5mr98732455ad.24.1745599856906; 
 Fri, 25 Apr 2025 09:50:56 -0700 (PDT)
Received: from stoup.. (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db50fff4dsm34637305ad.159.2025.04.25.09.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 09:50:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, dbarboza@ventanamicro.com
Subject: [PATCH alternate 0/2] target/riscv: Fix write_misa vs aligned next_pc
Date: Fri, 25 Apr 2025 09:50:53 -0700
Message-ID: <20250425165055.807801-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This is an alternate, but less exact approach.  It assumes that there
will never be a 16 or 48-bit csr write instruction.  This feels dirtier,
but it's a fair assumption involves much less faff.


r~


Richard Henderson (2):
  target/riscv: Update pc before csrw, csrrw
  target/riscv: Fix write_misa vs aligned next_pc

 target/riscv/csr.c                      | 9 ++++++---
 target/riscv/insn_trans/trans_rvi.c.inc | 4 ++++
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.43.0


