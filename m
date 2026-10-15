Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08EFCC6B33
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 09:20:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHHdE-0006TK-HQ; Thu, 15 Oct 2026 05:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHHd5-0006KI-IG
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 05:20:04 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHHd3-0004Yf-Pn
 for qemu-riscv@nongnu.org; Thu, 15 Oct 2026 05:20:03 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8ac4806e210so35558707b3.1
 for <qemu-riscv@nongnu.org>; Thu, 15 Oct 2026 02:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792056000; cv=none;
 d=google.com; s=arc-20260327;
 b=M75yX8GfJE6d4aXauohPaTQ0xq/TYPZrN63sODJ7F7EB9M6UjiEPNzeo2KM6r5viFE
 RuOzkGMDmpk2tasWguyzBVpFQSG2fuoMCgjszDG1liLWydaBFbg+8H47FdBSm/jQLH1o
 ThT78Of6Hah4DV2SjLgBs2JsdZxhAZjdxrJePrhpNwByA6mZf4L58DcHA//ZWSkVHS3J
 6cGeQYbmCAyaZq7zKZXG+lY5sBj3rUK0l/JvirylwOrmt5tICGwJWdu/0tn5Dm164CI9
 69Yq/NR6YnMf0aCyDOvxR8rgH5De5t9Hgsbkpwc6mCN+ATAjQuWgnhiHr6BbaZTMJgCJ
 u0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SZ7Y1+FBgY5Dl+mpVpiMYC1qCKS8oNM9QTtedf58UOc=;
 fh=xYhR/FkjAwlMRrEifbzI5pCMfYF+xiGbEbyP/HBga3Q=;
 b=VfP0wExKGm+p7mQAo10YvED5AM944sIld5raa9JnRbOaXsdKad7dlbdlpfnUaMsRBO
 mHKoOn+qFPIjM+LabjwgzIQZ50UbUoCC4yGaQ6My22CrlfhZY4f1bJS2DAq9ektWjZKP
 XofFl2F4wzO9VyKpX6pqZS0h/KYOB6T9D3fzDeFxXy2SOqMPG4BjcwVldiQS6xhzi59X
 N6KcIRbmxNQYwqWE1jcdr6oQjzSBedZX+G+q+nqRYZDXFbnmEkC3oTJOjgk5ZO4uU4SK
 Z8OiDr65dKEZTwe+0sm00Lmy5wjq6JKdDM79npGGkTs6wZ4C7trHPppJxuw5aSdeXzI8
 p1lA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792056000; x=1792660800; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=SZ7Y1+FBgY5Dl+mpVpiMYC1qCKS8oNM9QTtedf58UOc=;
 b=xqZtIz1zkmRPR8RmaBaA0SkkmtGtFIF4A6NX7HX6f3KgBI3IbqZgRsCpP3LAfgVKh8
 AVpwNwCna+4lNQ2lS6BO5Fm6LI1RTtcjty72iYH1CC4H/iCagpWvxLhpqC3R0cUcreCL
 bHzNIJr33gpHoWG/tE3S7DLxWJW5lZ8xt3xCFwth/sdGwWiqjL7VGuTDCKOGuh+jqul0
 9WekJlY8eZzei435kOcwTS965nckK4gh6TT//aGb4Z1TkU2AUPN6Jw2LWnZa6ycmm4nj
 VPnQ6Q8toCy/heW6A6n9h/q4eCk9cfe0pmkXnm86elr+dWOYjZdJp0/WBfu7jnetfb5J
 +egA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792056000; x=1792660800;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=SZ7Y1+FBgY5Dl+mpVpiMYC1qCKS8oNM9QTtedf58UOc=;
 b=O7SI08nvQ/Wgn4YexgRDnsozayqws1kzw6lQHSHqg4H0DfiE4I5V84jxMbUNwXuSiu
 uqa+rYbPWq6jtrPXlrDDj/Fb+qmiGesdHWscnOGQThrWhjnU+CTE2gqyrpuDMNhXLtc7
 O+IJUxMDVlxOiKBKxAcXa/hF6AeeaX+z5gvXkPDldE8xTS5Jqh46g3I6mF2PwhFDgj42
 Myt6A/Livua4w9W4c4oCeLVMy+ALTOYCOcDRf5jmplXMzvdPlIt1a2wUnmQETn2E2jGy
 b0SrsqvRPpg8lM2BlwBxMeHza8/xAI1LNBI1mr6I57tB7xwrY178zUcmW3uuiKdvP737
 9tSA==
X-Forwarded-Encrypted: i=1;
 AKwUvByiq4qqx4hJOHP7BKhKOIxVF1Vd1KZN5OFG6Cor8xRg16x/6QEtBaB3Y3OgQrPYelFFz66W4PA4bl+I@nongnu.org
X-Gm-Message-State: AFq9FYKpHkDd8bs3ZO4Pi5lof7CeaRMxvDfgeW//wHTyWos/D3mv7K+4
 z4n+nPj2N3vOeK/lxsiWQmuUFNYKPz9t0mexWsGPkVSEOncl6gagaUqEpRwC5u/bHwASuoNZmzd
 euAbkbP8/XO36biYcE7KS6+YLZPUMhV9jK92LVHicQQ==
X-Gm-Gg: AYBFou3GWSgHjeVZr8CnPEnRHVMcOD1RwHEWMcs0KUNQe3qH6iStBcIgMmHoTPqXoly
 OGM9Lt2lslAUMzRDFD7jThzhmk/4WhL5UjZTPhNr12y0pIKae2uHT2K9gUsU+VeiaY9evHUTG7Q
 YH6Ji+4dewDUUGakY6GeZ2aLwls7gveWrsjsRlTb4nAlewAVVvre+wM120AXVIy4k7vNWkD+EZO
 a1zXGmaUFQtQKZaExs/krcSLG1w+jUgYk4wNr1PKpwrtuffJuaW0KI7Ecwe0FlHQ9D63azJFpl8
 VcGXsRhIlS17Vzx1NaNNVRXqe9pAL3+EO1H2Dm6gcsLCLgoYPZV6Rea5bs9KDWDFaVYcoNq5ECS
 afi1AtsUVVON53c5r2k6jsYs8Hlc88hZI5uC9OkM=
X-Received: by 2002:a05:690c:c505:b0:8b0:a957:80bc with SMTP id
 00721157ae682-8b0a9578579mr42236477b3.40.1792056000217; Thu, 15 Oct 2026
 02:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20261015044104.879-1-luoyonggang@gmail.com>
In-Reply-To: <20261015044104.879-1-luoyonggang@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 10:19:48 +0100
X-Gm-Features: AclHuK8gM5bUiFgbG3d7VBzzzSM1hm7hlcc99eksUtYmNJT_j9_3Kh3RVwsNUig
Message-ID: <CAFEAcA8n9E1jpcOCat0kzv0Q++x7YwK_MNJBJ0qGdtX1-As4zg@mail.gmail.com>
Subject: Re: [PATCH] target-info: dispatch CPU QMP, dump, monitor,
 and Angel semihosting
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Cornelia Huck <cohuck@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Bibo Mao <maobibo@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Song Gao <17746591750@163.com>, 
 Chinmay Rath <rathc@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Xianglai Li <lixianglai@loongson.cn>,
 Chao Liu <chao.liu@processmission.com>, qemu-s390x@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Thu, 15 Oct 2026 at 05:41, Yonggang Luo <luoyonggang@gmail.com> wrote:
>
> Put query-cpu-definitions, dump notes, monitor, and Angel semihosting on
> TargetOps[SYS_EMU_TARGET__MAX] and look up by target_arch().
> Keep the table in target-ops.c and with a stub
>
> - Register with a QEMU_ARCH_* bitmask so shared base-arch objects
>   can fill both slots (e.g. QEMU_ARCH_ARM is ARM|AARCH64).
> - TARGET_INFO_CPU_OP is type_init. A NULL member means no handler.
> - Drop stubs/qmp-cpu.c
>        stubs/hmp-cmd-info_tlb.c
>        stubs/hmp-cmd-info_mem.c
>        stubs/dump.c
>
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  MAINTAINERS                           |  1 -
>  hw/core/cpu-system.c                  | 23 ++++++++++
>  hw/core/machine-qmp-cmds.c            | 27 ++++++++++++
>  include/qemu/target-ops.h             | 59 +++++++++++++++++++++++++
>  include/semihosting/common-semi.h     | 63 ++++++++++++++++++++++++---
>  meson.build                           |  1 +
>  monitor/hmp.c                         | 25 +++++++++++
>  stubs/dump.c                          | 27 ------------
>  stubs/hmp-cmd-info_mem.c              | 12 -----
>  stubs/hmp-cmd-info_tlb.c              | 12 -----
>  stubs/meson.build                     |  4 --
>  stubs/qmp-cpu.c                       | 21 ---------
>  target-ops.c                          | 49 +++++++++++++++++++++
>  target/arm/arch_dump.c                |  8 +++-
>  target/arm/arm-qmp-cmds.c             | 15 +++++--
>  target/arm/common-semi-target.c       | 26 ++++++++---
>  target/arm/meson.build                |  7 +--
>  target/hexagon/common-semi-target.c   | 26 ++++++++---
>  target/i386/arch_dump.c               |  8 +++-
>  target/i386/cpu-system.c              | 12 +++--
>  target/i386/cpu.c                     |  6 ++-
>  target/i386/monitor.c                 |  8 +++-
>  target/loongarch/arch_dump.c          |  8 +++-
>  target/loongarch/loongarch-qmp-cmds.c | 15 +++++--
>  target/m68k/monitor.c                 |  4 +-
>  target/mips/system/mips-qmp-cmds.c    | 15 +++----
>  target/ppc/arch_dump.c                |  8 +++-
>  target/ppc/monitor.c                  |  4 +-
>  target/ppc/ppc-qmp-cmds.c             | 15 +++----
>  target/riscv/arch_dump.c              |  8 +++-
>  target/riscv/common-semi-target.c     | 28 ++++++++----
>  target/riscv/meson.build              |  4 +-
>  target/riscv/monitor.c                |  4 +-
>  target/riscv/riscv-qmp-cmds.c         | 15 +++++--
>  target/s390x/arch_dump.c              |  8 +++-
>  target/s390x/cpu_models_system.c      | 15 +++++--
>  target/sh4/monitor.c                  |  4 +-
>  target/sparc/monitor.c                |  4 +-
>  target/xtensa/monitor.c               |  4 +-
>  39 files changed, 428 insertions(+), 175 deletions(-)
>  create mode 100644 include/qemu/target-ops.h
>  delete mode 100644 stubs/dump.c
>  delete mode 100644 stubs/hmp-cmd-info_mem.c
>  delete mode 100644 stubs/hmp-cmd-info_tlb.c
>  delete mode 100644 stubs/qmp-cpu.c
>  create mode 100644 target-ops.c

Too big a patch touching stuff all over the place with
insufficient explanation of what it's doing or why.

thanks
-- PMM

