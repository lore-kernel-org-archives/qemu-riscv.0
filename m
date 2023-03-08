Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa0G9-00081i-0i
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 15:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0G7-00081K-K4
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:35 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0G5-0002RW-L6
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 15:19:35 -0500
Received: by mail-oi1-x236.google.com with SMTP id t22so13091485oiw.12
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 12:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K/wTU1insbTSQSCHyzMrWKAQ0M88DmCBOmdr8lZ66rw=;
 b=EAMFxLC7Yq0xWrRV8D+QN0cfOBQzLQn5fp1L6mvPWWfvbdqMwM4Mew8wTvdNnAQkP5
 5gO9b+LTmxE95D/7UxiEF0h6R780IPeAZ/wAWXK4rdEsvhhqJaNvF7rHbk7gAQF5PKmA
 fiujHgngOeYC3uxhmaSoKyKQKrVJzt7DPGYaYe38kn0TqYIX0hxh+F8D1qr63YViUP8r
 WFzlz4+qxzH7lL5z2enEdtQ7ZfJ2JMSgvPhWpjWAWxy56DZoiaKAlA1URS7TFSfwofrL
 Mpo0ah/ywPhOWqxCj9ZqSDmxxK0n4Y0Rjjk45349VSjTfKy+5DGkmb1yKldRT/M7Ep9g
 ZSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/wTU1insbTSQSCHyzMrWKAQ0M88DmCBOmdr8lZ66rw=;
 b=5p0HiTvaasUCjU8QPaWGV6Pd4z+Vr8l8dP0JY3AhllXeiGf8kLgebc8iWb6CPZxk7l
 r4JwowVng0Bg+9j6f1ay7Pmyrv4ILYz5XFAxwvQ0IUdYFCrdxtoD4CmErb4g31hu9qDg
 leSpMOJObAMq6bo8cWzE4qm0hl2fF6DIOnP1cqxUH/J0qBijCBmuxg2xHHDXUDwe8cZF
 e6PZ1b3L2mnpL1EgTc2aV4QSErdCD8UzvMd6Oy7IwxYDbaQ2DZKf4pkTKs6A1jnPQyne
 B568dMVIJCidvKMhwMK+vXx4XjFBJK8UTFIYbqfwYLhNxRmmO2Qf7/hpK06vAs/z3jpo
 9aVw==
X-Gm-Message-State: AO0yUKWUoxbBgnN2i6g8sO/Dj3f/wLPCo0DKx+/JEHMjcaY47Dr2gi1Q
 CzU4bXYsNUWLcmiBHGFatjAQTQ==
X-Google-Smtp-Source: AK7set/25H2rAPO8E3uVpqv2IX1JjKpeZMgDYylQttLCXbMToG7ri7PF7jZUtKIL4hP2XiQkFgPn4Q==
X-Received: by 2002:aca:2311:0:b0:383:f4fb:be63 with SMTP id
 e17-20020aca2311000000b00383f4fbbe63mr7817213oie.37.1678306772285; 
 Wed, 08 Mar 2023 12:19:32 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:19:31 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 00/17] centralize CPU extensions logic
Date: Wed,  8 Mar 2023 17:19:08 -0300
Message-Id: <20230308201925.258223-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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
X-List-Received-Date: Wed, 08 Mar 2023 20:19:35 -0000

Hi,

During the review of a series that did some work in the RISCV_FEATURES*
enum, Liu Zhiwei commented on how we could centralize the all the
extension validation code and integrate it with write_misa() [1].

This does at least part of what was suggested. The idea is that, ATM, we
have too many places setting cpu->cfg and the validation logic is
scattered around (e.g. there are some contraints in write_misa() that
should be applicable elsewhere). This series is an attempt to centralize
things a bit.

The main accomplishments of this series are:

- the parent device riscv-cpu no longer sets any cpu->cfg attribute. This
  was forcing init() functions to disable extensions that it wouldn't
  use just because the parent device was enabling it;

- all validations are centered in validate_set_extensions(), with
  pontual exceptions in write_misa() that has exclusive contraints;

- set_misa() now writes cpu->cfg. No need to have one function to set
  env->misa_ext and then another to set cpu->cfg;

- register_cpu_props() now only exposes user-facing props;

- all validations from validate_set_extensions() are done at the start
  of the function. Validate first, set extensions after;

- RVE is now forbidden in all validations, not just in write_misa();

- RVG is now forbidden in write_misa();

- write_misa now uses set_misa() and validate_set_extensions().



[1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05092.html

Daniel Henrique Barboza (17):
  target/riscv/cpu.c: add riscv_cpu_validate_v()
  target/riscv/cpu.c: remove set_vext_version()
  target/riscv/cpu.c: remove set_priv_version()
  target/riscv: add PRIV_VERSION_LATEST macro
  target/riscv/cpu.c: add riscv_cpu_validate_priv_spec()
  target/riscv: move realize() validations to
    riscv_cpu_validate_set_extensions()
  target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()
  target/riscv/cpu.c: avoid set_misa() in validate_set_extensions()
  target/riscv/cpu.c: set cpu config in set_misa()
  target/riscv/cpu.c: redesign register_cpu_props()
  target/riscv/cpu.c: move riscv_cpu_validate_v() up
  target/riscv: put env->misa_ext <-> cpu->cfg code into helpers
  target/riscv/cpu.c: split riscv_cpu_validate_priv_spec()
  target/riscv/cpu.c: do not allow RVE to be set
  target/riscv: add RVG
  target/riscv: do not allow RVG in write_misa()
  target/riscv: rework write_misa()

 target/riscv/cpu.c | 516 +++++++++++++++++++++++++--------------------
 target/riscv/cpu.h |   9 +-
 target/riscv/csr.c |  52 ++---
 3 files changed, 323 insertions(+), 254 deletions(-)

-- 
2.39.2


