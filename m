Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366EFEB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 14:33:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qE9kK-00041O-CL; Tue, 27 Jun 2023 10:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qE9kI-00040d-P6
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 10:32:42 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qE9kH-0003aK-0n
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 10:32:42 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-98e1c6a687fso308478166b.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 07:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687876359; x=1690468359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yXF/f9t11zAakpvjOX4nDrtnLXHNdzigFTidlmb+aUY=;
 b=LQHHK8u4R1ctyBaBMB8vnFgcgXerPU+61dRqHkMPCrIJYghNCth9RtJiDhuqP0I6eJ
 nTPSIQJx3Yat0uRIw0Tm4NJ/QVDVlM/u1KLdrhfOQIyuhj2WlKRGcoBmfx7QC8zM0rgH
 r9M6kEsK+SQyYbhJAgSfzprjw1vaxgE03d/H1pC3egtt+OOnyyr1mrWmJyVge+Rrlb2C
 THSCwElliI4If6Hr0O10e9tEUHXoJywMR0DITYD8wExJMLLaIDkANxocfYmxr5UMha9U
 LOMiggZiodPypnqSbzghbZKEgm2VxiJIT2PlK4OHDEzBvaZ3cg3Ub8hEll9oFsENcXh4
 SNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687876359; x=1690468359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yXF/f9t11zAakpvjOX4nDrtnLXHNdzigFTidlmb+aUY=;
 b=YtW1KHiHCvWAO2r5hpVVtZYyU1rQlzesdH3QfFanhbl6NiSsz3NWePGb2U4AM69B9m
 qCxRmpD3cdPYE05j4Odg1dKwnYvt/7RfzBdeR9EyPEmwfga1bLEPZGyVas0T3eJ7lZGb
 B4aj/LgLDP548kK+GMu+k89CdDk5YnT1zIk3MlPpHL3Djk1RQ1dQjNumpbN7aEGC5B+w
 lsyFpdfCutghwim84/IPL0ItT6XyQ54OQcZe8O5iwlfV0NW6aZFp69p06meJSgUvrusW
 m8VnXJ14ehvFJJFgPlyawA8X32SRotzBCm0sopbJ+bzaYQqzcmCIx0WUq83+apFqAXb0
 vppg==
X-Gm-Message-State: AC+VfDyd+9KVYBsCx3vzEOjHzm2OuGE+GLVE/5kRxd7AZw9kXppj+ZOs
 cJYIm6rHGMlqxvhD0N3dEumMvtdKJblOuAPRV34=
X-Google-Smtp-Source: ACHHUZ7agzdM9Dedx+yKJmJVGN3r3Xb00OXtCRck4mDcWPTGYGfERVO6owTNh5AtEL3cH+xhr6ZfYg==
X-Received: by 2002:a17:907:a061:b0:991:fd87:169e with SMTP id
 ia1-20020a170907a06100b00991fd87169emr2306237ejc.8.1687876359432; 
 Tue, 27 Jun 2023 07:32:39 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.204])
 by smtp.gmail.com with ESMTPSA id
 re3-20020a170906d8c300b00977ca5de275sm4690670ejb.13.2023.06.27.07.32.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Jun 2023 07:32:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org
Subject: [PATCH 0/2] target/riscv: Only build qemu-system-riscv$$ on rv$$ host
Date: Tue, 27 Jun 2023 16:32:33 +0200
Message-Id: <20230627143235.29947-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Per Anup Patel in [*]:

 > Currently, we only support running rv64 guest on rv64 host
 > and rv32 guest on rv32 host.
 >
 > In the future, we might support running rv32 guest on rv64
 > host but as of now we don't see a strong push for it.

Therefore, when only using the KVM accelerator it is pointless
to build qemu-system-riscv32 on a rv64 host (or qemu-system-riscv64
on a rv32 host). Restrict meson to only build the correct binary,
avoiding to waste ressources building unusable code.

[*] https://lore.kernel.org/qemu-devel/CAAhSdy2JeRHeeoEc1XKQhPO3aDz4YKeyQsPT4S8yKJcYTA+AiQ@mail.gmail.com/

Based-on: <20230626232007.8933-1-philmd@linaro.org>
"target/riscv: Allow building without TCG (KVM-only so far)"
https://lore.kernel.org/qemu-devel/20230626232007.8933-1-philmd@linaro.org/

Philippe Mathieu-Daudé (2):
  target/riscv: Only unify 'riscv32/64' -> 'riscv' for host cpu in meson
  target/riscv: Only build KVM guest with same wordsize as host

 meson.build | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

-- 
2.38.1


