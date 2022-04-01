Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1naGse-0007SF-VK
	for mharc-qemu-riscv@gnu.org; Fri, 01 Apr 2022 08:59:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naGse-0007RN-7D
 for qemu-riscv@nongnu.org; Fri, 01 Apr 2022 08:59:56 -0400
Received: from [2607:f8b0:4864:20::232] (port=36689
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naGsb-00036r-HF
 for qemu-riscv@nongnu.org; Fri, 01 Apr 2022 08:59:55 -0400
Received: by mail-oi1-x232.google.com with SMTP id z8so2730499oix.3
 for <qemu-riscv@nongnu.org>; Fri, 01 Apr 2022 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lHTIKlFTOyTuMO3EN5hl6x3OzHRNh+rfoK+IU3lo3bQ=;
 b=fLeiycm2oEsK9O1d/+vkn7gtS0HqLho7ekpy96fpfbfto+Xp3adwFdqUHEXpO/VmGq
 uQif6+q/u2C0831jv0vf9Px379ZaFQH75PfWZ5aiu67ViwhNrdFvfl8+TIJpI1sp7bXR
 8+QQV3ZQaR2r60iLRLRRuGjXxphto2gGQZhGIfCVDxPY/1H1j2tdAI8EFawzmRpMLbjV
 GSlkJRU78xum9QkT+LD5wC0g+lM5VWkrAsTOKfzi+pFH8BUcx19oy+TIhLDLDQVApfuP
 LzLE7/gWFjLViIyJ0UB0n/so+ZLZZ3aYb2tcRpT+4WI+pIb0vYvypyzzbAFwWCawDG8d
 o4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lHTIKlFTOyTuMO3EN5hl6x3OzHRNh+rfoK+IU3lo3bQ=;
 b=F8voErJbgsjVUnNvVLV8TNosrhYNqtHmM8TRIhI0J1jblXsoOQEV7Dx8Mj0R5+aqQD
 bFzTd+qGNz+DU1PmyH0YnYrD13OeI/+FXIYqVeLn7AxV0F2s3HhvOjgXz7Hd2I7FpcQd
 0rgmRGy03bXdyJEUqNZ2iuZbJIqCynv3/qJ/HyGS6Q3JvwlyqiIiHirOachqW3yR9nIT
 Bgnzf9aj5ivagcsD0+pcf3oPP2WLlEbgdUhfG1/kXcbmvTvZpVu8qDad7Od67kAb6x1Z
 G0s4d1CS6w5aSuF/gqVNENtX5jl4IUwT70zSp3qPCPvrkvURUeAbY+P5c1DXcuF2I66W
 n55Q==
X-Gm-Message-State: AOAM531SqXOBQ82hfn6sYPZSPBfLLCorJkGlqe8trYnUgOifamIaE+ds
 TkST24PCiZRWBUTHOn0lRc4zTw==
X-Google-Smtp-Source: ABdhPJwPYX54Zzx4Z+3Vz3taOEAh8k+Em9SDXhjzsX7/lfeypI/ZHhB49FxG3dQMGt4l5+riWHG/aQ==
X-Received: by 2002:a05:6808:8f4:b0:2f7:20e5:1188 with SMTP id
 d20-20020a05680808f400b002f720e51188mr4525809oic.46.1648817991013; 
 Fri, 01 Apr 2022 05:59:51 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 h6-20020a9d7986000000b005ce0d5433cdsm1066665otm.15.2022.04.01.05.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 05:59:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, palmer@dabbelt.com,
 bin.meng@windriver.com
Subject: [PATCH 0/2] target/riscv: Annotate atomic operations
Date: Fri,  1 Apr 2022 06:59:46 -0600
Message-Id: <20220401125948.79292-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 01 Apr 2022 12:59:56 -0000

If an atomic operation fails on RISC-V, we want to generate
a store/amo fault and not a load fault.

Annotate amo insns, so that we can recognize them after unwinding.
Transform the implementation access type to store/amo for reporting.


r~


Richard Henderson (2):
  target/riscv: Use cpu_loop_exit_restore directly from mmu faults
  target/riscv: Mark amo insns during translation

 target/riscv/cpu.h                      | 15 ++++++
 target/riscv/cpu.c                      |  3 ++
 target/riscv/cpu_helper.c               | 62 +++++++++++++++++--------
 target/riscv/translate.c                |  9 ++++
 target/riscv/insn_trans/trans_rva.c.inc | 11 ++++-
 5 files changed, 79 insertions(+), 21 deletions(-)

-- 
2.25.1


