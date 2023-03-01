Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXW6l-0003hA-BP
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 18:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXW6g-0003gk-Pk
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 18:43:34 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXW6e-0004wO-Df
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 18:43:34 -0500
Received: by mail-pl1-x62c.google.com with SMTP id i10so15754712plr.9
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 15:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677714210;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=rymWH8j0FOTNy4RV5JJpfjea5x+7Bac53/l2RgNpI8I=;
 b=ylrN84R7KCtZvdPhVCaNVD462l5dNBDyaJrvSt93mZH+iFQfPrcGs7CMMIxDQdn+3D
 uKTMf6QO+Rh3BFNQoZ0Z575Jm2bfKBPeo6sUId//wwlV/WAfbtqs1vfrgDNIStdg4+y5
 cb4kjSO6KVK+/6PPuZ/wBb1AyQWtiJbMCWCnz/LFhFi5NUYqWzR9Gn86mm8KPSSKzAX6
 n91xzV87O34RlYVNuk6F2wY+v8QX/efw/MlASkzEno2Cd+VKdac6ZP9c6wExEObeAoXY
 6mnpvrX6KNrI7qvDWMtzrkeqtgQTiNPSm8VzBp/MvArHqRX4VIydjxNn2BD2KbMQxxwt
 C/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677714210;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rymWH8j0FOTNy4RV5JJpfjea5x+7Bac53/l2RgNpI8I=;
 b=nl7rhdRFbEvVUCrN5v7xHgdMR57i9zNBqQM3nmocyzh7X8woYIEROiM/W0bkU2bArK
 GyJanh8YZGuZ247qcv3T5jUMajKraGXJ4327e4eKiuwN4uxCF5Cp8jp2V8l3HAmFAY6j
 u0smipuyEtk61UmPMEdLbtwrtzyW2d37nyXyRvXQ2feJEO44c8AqWmXUs/+wLWH6CH9s
 zM3wUj/SJURBSgvQU6hkuRm6NBh5aomS42n2KXXCIIGsWQnsna1kJ7XcqWee/vH+9Y27
 3r1pzJ6fqrn0L5nDUuu7ONrjWPpE4lVUCq6XeT2WhZzr2EfPh41xwfCG2bpTYETibV5w
 A9/Q==
X-Gm-Message-State: AO0yUKXPoZc/XNjlFtCVZ3k7E61E8ayH78KINV1uEPsJ9l/WMpkbzL6L
 wfdSNKLlwZb5uczVxGJbsd2WDw==
X-Google-Smtp-Source: AK7set/qyhgH1EgDXmAJXhL/ieAUJGFasiDBTEpG54j6lSwysuO+Orm0FkG0wFM19NGqH/bAIKmd9w==
X-Received: by 2002:a17:902:dac3:b0:19a:a210:825 with SMTP id
 q3-20020a170902dac300b0019aa2100825mr180631plx.20.1677714210338; 
 Wed, 01 Mar 2023 15:43:30 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 p12-20020a170902eacc00b0019896d29197sm8933299pld.46.2023.03.01.15.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 15:43:29 -0800 (PST)
Date: Wed, 01 Mar 2023 15:43:29 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 13:57:34 PST (-0800)
Subject: Re: [PATCH v7 00/10] make write_misa a no-op and FEATURE_* cleanups
In-Reply-To: <20230222185205.355361-1-dbarboza@ventanamicro.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 dbarboza@ventanamicro.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-4f458d7a-5b65-415d-8d6d-2945db18b8d1@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 01 Mar 2023 23:43:35 -0000

On Wed, 22 Feb 2023 10:51:55 PST (-0800), dbarboza@ventanamicro.com wrote:
> Hi,
>
> In this version we gave up removing all the write_misa() body and,
> instead, we went back to something closer to what we were doing in v2.
> write_misa() is now gated behind an experimental x-misa-w cfg option,
> defaulted to false.
>
> The idea is that x-misa-w allow us to keep experimenting and testing the
> code. Marking it as experimental will (hopefully) make users wary of the
> fact that this feature is unstable. The expectation is that the flag will
> be removed once write_misa() is ready to always write MISA.
>
> Changes from v6:
> - patches without reviews/acks: patch 3
> - patch 2: taken from version 3, acks and r-bs preserved
> - patch 3:
>   - rename 'misa-w' to 'x-misa-w' to be clearer about our intents with
>     the cfg option
> - v6 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05047.html
>
> Daniel Henrique Barboza (10):
>   target/riscv: introduce riscv_cpu_cfg()
>   target/riscv: do not mask unsupported QEMU extensions in write_misa()
>   target/riscv: allow MISA writes as experimental
>   target/riscv: remove RISCV_FEATURE_DEBUG
>   target/riscv/cpu.c: error out if EPMP is enabled without PMP
>   target/riscv: remove RISCV_FEATURE_EPMP
>   target/riscv: remove RISCV_FEATURE_PMP
>   hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
>     create_fdt_socket_cpus()
>   target/riscv: remove RISCV_FEATURE_MMU
>   target/riscv/cpu: remove CPUArchState::features and friends
>
>  hw/riscv/virt.c           |  7 ++++---
>  target/riscv/cpu.c        | 25 ++++++++++---------------
>  target/riscv/cpu.h        | 29 ++++++-----------------------
>  target/riscv/cpu_helper.c |  6 +++---
>  target/riscv/csr.c        | 15 ++++++---------
>  target/riscv/machine.c    | 11 ++++-------
>  target/riscv/monitor.c    |  2 +-
>  target/riscv/op_helper.c  |  2 +-
>  target/riscv/pmp.c        |  8 ++++----
>  9 files changed, 39 insertions(+), 66 deletions(-)

I just queued this up, using the text from the v1 as that's more of a 
description of the patch set.  I think that text is still sufficiently 
accurate, but let me know if I missed anything.  Here's what I ended up 
with

    Merge patch series "make write_misa a no-op and FEATURE_* cleanups"
    
    Daniel Henrique Barboza <dbarboza@ventanamicro.com> says:
    
    The RISCV_FEATURES_* enum and the CPUArchState::features attribute were
    introduced 4+ years ago, as a way to retrieve the enabled hart features
    that aren't represented via MISA CSR bits. Time passed on, and
    RISCVCPUConfig was introduced. With it, we now have a centralized way of
    reading all hart features that are enabled/disabled by the user and the
    board. All recent features are reading their correspondent cpu->cfg.X
    flag.
    
    All but the 5 features in the RISCV_FEATURE_* enum. These features are
    still operating in the same way: set it during riscv_cpu_realize() using
    their cpu->cfg value, read it using riscv_feature() when needed. There
    is nothing special about them in comparison with all the other features
    and extensions to justify this special handling.
    
    This series then is doing two things: first we're actually allowing
    users to write the MISA CSR if they so choose. Then we're deprecate each
    RISC_FEATURE_* usage until, in patch 11, we remove everything related to
    it. All 5 existing RISCV_FEATURE_* features will be handled as everyone
    else.

Thanks!

