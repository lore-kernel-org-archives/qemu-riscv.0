Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phZbn-0004II-9g
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 13:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZbl-0004Hh-9H
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:13 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZbj-00012O-A4
 for qemu-riscv@nongnu.org; Wed, 29 Mar 2023 13:29:12 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 n6-20020a4abd06000000b0053b59893660so2560976oop.0
 for <qemu-riscv@nongnu.org>; Wed, 29 Mar 2023 10:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=srykymGZSHMWyT9lGb70r0X8KXpaRiUlM8J4gZTg6/4=;
 b=pP7AjHtY7RkroEzC+8/my7CXmCjq02HllQ8EG7FeUj1slorOQe/CiUNBPLePWso+Df
 7a0hJQbxD14Hq3zU4GQ4rrERJvjGqIvwbKXabfnRmObTONj6TeL/jfEyn0AlRR3UM2GU
 2Q4qPDn+og3YFYVleZmHV5uc0D7PjgLeQ/SgCWyfWiRQMZRRCBS9iFgsdW7V10UFW3kJ
 bR1UnGrFL4O9koLaQfcp63WaYcGpCrsGRB7MGq0k1f4gfj6BeCnsq9x6tx30C7ipRrA4
 HugZD1IwtVBrfpLhMq1EhXsDbUOK9m56i/siZsjmTrNsdIimRS3zew901ivLaV+1HHzK
 ZNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=srykymGZSHMWyT9lGb70r0X8KXpaRiUlM8J4gZTg6/4=;
 b=mEWNaGU4wvf+ykXZZI64eHbx5/qm8OahhD9bmMusH9y4VwUO6vxxfSVUKVTyBT/MJ9
 s+UVuy6ou+gq2hu3zLgZUZIAKRSOxqMPvb/18whrCmFO33gwadNO8gkWRTGmu97vSj3w
 +Y0YFG29rrtnlF6CvJGqbgSWyyG+q534O5XR5vePIxkZKFePx8VgJg1Uv/uBjMrG7ACd
 pXDkkelczGpyDYxMRu94kQ2Cc7D9Iw+9RS6ssI267X9pUOCVw7fz2sfD+C2HoRd/4DvV
 TLpyodMp4GPZKiJ5jcDFrILd2QLUNkxVXU2JkXVRsgM7OR3fG5p9A5uZGwmCky5FjjPU
 SwDQ==
X-Gm-Message-State: AO0yUKU6PCepEIyw1XU203eKGeEGiUtw0YnwSuhMtA7LJS1tDcarHGtF
 P+Zh7niaI+hA0A0WB0niZ+ZXag==
X-Google-Smtp-Source: AK7set+0APOf5msa52aPX4rtKxjuCjRN64ResEMwA6tAMjvb/AYZpbxGxrZ2vQ47QMHrWixEEWbBng==
X-Received: by 2002:a4a:3745:0:b0:53b:700e:378c with SMTP id
 r66-20020a4a3745000000b0053b700e378cmr9748952oor.9.1680110949998; 
 Wed, 29 Mar 2023 10:29:09 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:09 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 00/20]  remove MISA ext_N flags from cpu->cfg, 
Date: Wed, 29 Mar 2023 14:28:43 -0300
Message-Id: <20230329172903.636383-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2d.google.com
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
X-List-Received-Date: Wed, 29 Mar 2023 17:29:13 -0000

Hi,

This new version has a new patch (3) that removes the 'multi_letter'
attribute from isa_ext_data that became redundant after the changes made
in patch 2. The change was proposed by Weiwei Li in the v2.

All patches but patch 3 are acked.

Changes from v2:
- patch 3 (new)
  - remove 'multi_letter' from isa_ext_data
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06493.html

Daniel Henrique Barboza (20):
  target/riscv: sync env->misa_ext* with cpu->cfg in realize()
  target/riscv: remove MISA properties from isa_edata_arr[]
  target/riscv/cpu.c: remove 'multi_letter' from isa_ext_data
  target/riscv: introduce riscv_cpu_add_misa_properties()
  target/riscv: remove cpu->cfg.ext_a
  target/riscv: remove cpu->cfg.ext_c
  target/riscv: remove cpu->cfg.ext_d
  target/riscv: remove cpu->cfg.ext_f
  target/riscv: remove cpu->cfg.ext_i
  target/riscv: remove cpu->cfg.ext_e
  target/riscv: remove cpu->cfg.ext_m
  target/riscv: remove cpu->cfg.ext_s
  target/riscv: remove cpu->cfg.ext_u
  target/riscv: remove cpu->cfg.ext_h
  target/riscv: remove cpu->cfg.ext_j
  target/riscv: remove cpu->cfg.ext_v
  target/riscv: remove riscv_cpu_sync_misa_cfg()
  target/riscv: remove cfg.ext_g setup from rv64_thead_c906_cpu_init()
  target/riscv: add RVG and remove cpu->cfg.ext_g
  target/riscv/cpu.c: redesign register_cpu_props()

 target/riscv/cpu.c | 386 +++++++++++++++++++++++----------------------
 target/riscv/cpu.h |  19 +--
 2 files changed, 202 insertions(+), 203 deletions(-)

-- 
2.39.2


