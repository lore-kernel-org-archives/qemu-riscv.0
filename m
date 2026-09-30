Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EC3CA5FA5
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 02:51:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBkPW-00051Y-1h; Tue, 29 Sep 2026 22:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBkPU-000514-0k
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 22:51:08 -0400
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBkPS-00084i-Am
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 22:51:07 -0400
Received: by mail-ed2-x0e.google.com with SMTP id
 4fb4d7f45d1cf-6aae359e2c0so7253203a12.3
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 19:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790736664; cv=none;
 d=google.com; s=arc-20260327;
 b=I8VOrgH0juB38w4ioBpTYFeAGDqAOzJdp1nVhSHq2WQu/3p/kmdRz+69MZfhz940ZH
 +gZRm2A4RCnO6XgftGkcyUqB/+zdL/czU8Yx7RFA269YAdZ8je1599dJgxk8kNQbr9vo
 q1m49mGoA5JwCx+hBixtrE2uM6A76C4IugaQbtIlQliYVqm78be8rJ0SE+TZzIgVOwxe
 DUhikxuTj4+jeR4sHaD2CwQOIykNVSrKm3Stbj5lgNuQfRI5z/iRzasmZpwtGPzXATrH
 4TKepjUR6h5CnRJ1hpmcs8k+a/48YtUkOmpM7aW0SQl4sv9KBDzA9wXoXH95rkAu3pXh
 kZYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=EV6mrJxfEd7WOTTvXqOmWWny2bOcZB0m95vhp6g828E=;
 fh=MK9NXAv8nSEKv2aQ9JWKWTk6CpDsux3SCMuYTo1vQoo=;
 b=bM8b3acxnxjyP59UerhzN2Bj/2Mg4J+Wx2XUG8FEO+P3fddO+vroNci4QOJN+KtgYq
 EohC1b7T1Cc4sIDuCV1HyhqOsDGE0ybictQVpKNUtjXjNYUaTbnc5Y1TDbUskrJK+XzW
 v4j0Y/xV0BUjDSIeigQ3V6q6Go/W+NyuJYjxBQ+h5zFQlJQs3PnsMeIiiI3EeOS1hHsy
 x7BhfYVGGt2AjHWDJ/9DqMuICdmsXkRCor3J5qc1qL7+Dy1FfQRpU4mfdy6FZEs7jvo0
 AtTSg4ZMp+cc8i6i1+5C/3cNBrNL+zdEZAfnu9Fg90zrEysCp1HgKypb6H9SdgkUGfId
 LK3g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790736664; x=1791341464; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=EV6mrJxfEd7WOTTvXqOmWWny2bOcZB0m95vhp6g828E=;
 b=VMYByi8VCMZ1cYIgG275mu4P0V2YB/XAXXTkRCgQlfQGSCuo55jZOi266deaDFXd2j
 GfLCpEi+nbtktdO0vg2epBd54mKweEflTOU6dPUoftajSUyoeiQcSOWmFHjif+y/2UNn
 alop0CrT9MfGyTaRuTrZK54iyxvwrYAwgurR/50NmnyDXuxa0OCUQj/osw5Eg5b5Fi+o
 6VctPS3yg85GxozvOjz7xXQ+34UnjcpoKmNX21lXtHJFGJOH8aJfVxIHVcnDbKMEwG1J
 HoC9+zViYZAEmUSM/WxlCoZ3iun1N5LLEEnlgXhqURY3f9n9fkrGHKm3YjeGR+6CJvLB
 TxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790736664; x=1791341464;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EV6mrJxfEd7WOTTvXqOmWWny2bOcZB0m95vhp6g828E=;
 b=r6eOxGAKMOUsrqPjiqWuH/1AS14TbtXcVl7Y8XeDV/7KrNk3ZNTw4WYVEuEXFbs2EC
 IN2ufGKbBRAWkB3zr9UA3LIb24dimdssfiw+K4WmtgV2PYlscaZ6pLSm0sZdWSD4Hmnw
 lCEWEqmBLtBwxrGRoyT9lSAko17EF7aQ6mdNaFbcBoXYxCdRA2uY3sivPWHTJpxNkBOS
 pBYZD/URLilolZvimaO8VsPohPHmQ8jUi2y+7fq55LcJJgNErxxqXXtSuj2eGlxFGMe/
 BgeRU739DSS6Rb3l1uu3pUKCIJry8k4lORV4G1yOX9g097ZbyKEKw2uFx//hfNdqTHjV
 vQUw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxZNfqXMApl63ap5l0Jc1yo2SdxgVofyFEYNNtbM6Aw7gj7cJjrPbMOVAsKKHIWEXfGu/vtZCQdG3Ud@nongnu.org
X-Gm-Message-State: AFq9FYI7NulDReDM5WJIDlCPJnXW6Jfnh48MNA0glnCBFZlzAAS+ii95
 wQsAV5wS1hZ2GB//ZB/vP7bbD9Y4Q/sPSYmoKCHJ6UU8Sw2ur1lecYqR2VHbf2oNeqT7GUR4zj7
 kGhNJvmic5lw0vMoT+rowxEyRj9d4jQM=
X-Gm-Gg: AYBFou3BuIOEcPmHyXzypqXWDoYygoVjjt0oLZSZ5St24P/UwUYgvArsBqrJrp8qsQI
 qf1D7gpXuajTK4id9UW6PwtmiBQz2JklpOg3ZpPhxqcpAoqGf/2Hhyn6w3hq4d00wximvYZDNIA
 SNPni5kIBcF1FrhMrkxpau/LQFC3MKIEF8+gXktYXT7Im68/wnI0Dhmzbxwgcs0p4iVW+4OhXpb
 HB/jiKLH0XBme2UP9QLwThRX6TY3RFVy3eBm56+nBR+EDW+Bmbhstya2j22qnEjjqv3gq33d8JH
 O87JfaM4EhOd+bLF++raada/pE+My023MoFkeY4GhiD9/V4z3ypz4/w=
X-Received: by 2002:a05:6402:3785:b0:6ac:9a44:d412 with SMTP id
 4fb4d7f45d1cf-6ad4fd0b503mr556197a12.7.1790736663388; Tue, 29 Sep 2026
 19:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260926081551.29-1-luoyonggang@gmail.com>
In-Reply-To: <20260926081551.29-1-luoyonggang@gmail.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 30 Sep 2026 10:50:49 +0800
X-Gm-Features: AclHuK9fFP4b14helAoNXT3RwjpHnY1xuNl-fP9dsY21rLTwrOXFbzbzU_PGXH8
Message-ID: <CAE2XoE9tVCwQE0Mv-KPin+evQM4qh0mzj=sw-S1au2=uupM9ww@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] machine: uniquify virt QOM names
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, Stafford Horne <shorne@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Song Gao <17746591750@163.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Can this be queued now?

On Sat, Sep 26, 2026 at 4:15=E2=80=AFPM Yonggang Luo <luoyonggang@gmail.com=
> wrote:
>
> Multiple targets register a virt board as MACHINE_TYPE_NAME("virt").
> Those QOM types collide if more than one board is linked into one
> qemu-system process. This series splits the QOM type from the -M name
> so each virt board can keep a unique type while -M virt, help, and
> migration stay the same.
>
> - Add machine_class_set_name() so boards can set MachineClass::name
>   when it must differ from the QOM type. machine_class_base_init still
>   defaults the name to the QOM type without -machine. Document that
>   MachineClass::name is the -M name, not the QOM type. Sort -M help
>   by that name so order matches the printed names after types are
>   prefixed (arm-virt-11.1-machine vs virt-11.1).
> - Give each colliding virt board a unique QOM type and keep the
>   existing -M name via machine_class_set_name(): riscv-virt, arm-virt,
>   or1k-virt, hexagon-virt, loongarch-virt, m68k-virt, and xtensa-virt.
>   Versioned ARM, LoongArch, and M68K boards keep virt-<ver>. Latest
>   ARM virt still sets mc->alias to virt.
> - query-machines returns MachineInfo typename, the QOM type from
>   object_class_get_name(), for qom-list-properties. The -M name alone
>   is not that type once virt boards are prefixed.
>
> Changes v2 -> v3:
> The versioned-machine example in boards.h now follows hw/arm/virt.c.
> machine_class_set_name() keeps the -M name as virt-<version>, the QOM typ=
e in
> the example is arm-virt, and the latest helper is DEFINE_VIRT_MACHINE_AS_=
LATEST.
>
> Changes v1 -> v2:
> - query-machines returns MachineInfo typename. v1 returned only the
>   -M name, so a client that appended "-machine" looked up the wrong
>   type for a prefixed board such as arm-virt-11.1-machine versus
>   -M virt-11.1.
>
> Yonggang Luo (10):
>   machine: allow -M name to differ from QOM type
>   hw/riscv/virt: use unique QOM name
>   hw/arm/virt: use unique QOM name
>   hw/or1k/virt: use unique QOM name
>   hw/hexagon/virt: use unique QOM name
>   hw/loongarch/virt: use unique QOM name
>   hw/m68k/virt: use unique QOM name
>   hw/xtensa/virt: use unique QOM name
>   qapi: return MachineInfo typename from query-machines
>   machine: match the versioned virt example to arm virt
>
>  hw/arm/virt.c               |  3 +-
>  hw/core/machine-qmp-cmds.c  |  1 +
>  hw/core/machine.c           |  6 ++++
>  hw/hexagon/virt.c           |  1 +
>  hw/loongarch/virt.c         |  3 +-
>  hw/m68k/virt.c              |  7 ++--
>  hw/or1k/virt.c              |  3 +-
>  hw/riscv/virt.c             |  3 +-
>  hw/xtensa/virt.c            |  3 +-
>  include/hw/arm/virt.h       |  2 +-
>  include/hw/core/boards.h    | 26 +++++++++++----
>  include/hw/hexagon/virt.h   |  2 +-
>  include/hw/loongarch/virt.h |  2 +-
>  include/hw/riscv/virt.h     |  2 +-
>  qapi/machine.json           |  6 +++-
>  system/vl.c                 |  8 ++---
>  tests/qtest/qom-test.c      | 65 +++++++++++++++++++++++++++++++++----
>  17 files changed, 113 insertions(+), 30 deletions(-)
>
> --
> 2.52.0.windows.1
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

