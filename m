Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFAFC43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 04:59:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1whgqA-0003GI-L2; Thu, 09 Jul 2026 00:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1whgq8-0003Fr-Vs
 for qemu-riscv@nongnu.org; Thu, 09 Jul 2026 00:58:24 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1whgq6-0002Oc-VU
 for qemu-riscv@nongnu.org; Thu, 09 Jul 2026 00:58:24 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-69532288224so916697a12.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Jul 2026 21:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783573098; cv=none;
 d=google.com; s=arc-20260327;
 b=VqRGaK6kmLjdbMFSCzSjvGEeDBkqcLKuZFrqQGCy3Y1F5XbP6j2WxREbEFqWPCVeJB
 JKPFAOIUbKR8QCHGlFRV7ONi620k2sHIeW9Z3kT2ZcyrOGezvUbnXD9ibw5RvIXmoVnE
 Dth5NPJ4j+VM/LWxnPqvqrbE88bqOe4G5WGATFOUr8/ZpqPYGLLjqXNAa23T8AldxvXx
 JOcpUdyd/wU75sKG1fb9tZw/YsoCD4A9wwtRxe4B64xBmJk3zOUc1NqV7ERtR/jByoCH
 /r8pyrCa9lXnFTG09kz+4hRG2tW35Xp7iKdIJOhFy9rTShbZJQQrgx9U9B9C3iNQ/u92
 xAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6M7152Ey+cLEt8trzGQhwm7E7uUgPw9+yf5f13TRVxQ=;
 fh=MVktyZ6D9l1stU62AEnkHT5hRd7o+bvXOXgnDSQj4x0=;
 b=WfYnqcJlGrCjrjEHz7cBz8oiiwupU+arvNRjikdhWVW/eEpSVcIU5YkBbLUBFnbIlt
 7o1TPzuqr5UY7rfeoeqXsLSzZqMeRErmcgIjWU7PHV+EpgwAniUCxnvjrwn8/2w3sCW6
 aYw7V5UsaIuU+GUJDY+GzKEiORyp0+eUXw76lwxlJ5w9sj8CMk/ZrRoqjo0UoXQU40JS
 3aNOzb2NERS77u2u4fuGvT838tFsToZwupzcrGGUlhTomXMktUJjc7lL8OHmIcZtpi0g
 PDmbl8mAY/EgQ72A/krzOBcVs/uvVM+Mg9+s52KnwjU1XNbPuig+VCfvxeXaq4gzRVoP
 FfJw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783573098; x=1784177898; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6M7152Ey+cLEt8trzGQhwm7E7uUgPw9+yf5f13TRVxQ=;
 b=O5GwlWK+n5sB4tu95eA6RDoJqf7+Yt+xJmRkmbMBIlZL1k+5lVHw8eIKAXK7rKXZbP
 UCqw1CkuHv/cKLkLpmxS3FfMbD2gl5rXAanP1iSbKDlNJXJe3cOn1Sf58N1rNocPHR+E
 7VmJHBAHuCEkIhITQ/dwtfs5OTedsOg5qTVAAAGYnIBoPoTPS3lqQOtxxPdFFWeQeKbO
 UpkSzXMZqyi1Df1px7EiqjUxtTCoRpEYKgL+KOtJTh+kg4FGH8w3anKHCjM0W7V9wmbj
 bCh29nFr0ghG3WbqKrGa0TH0nkPZlKpBn/QsT9m523A+efAaNQWiQmg84gNFZaXMFOGe
 2s1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783573098; x=1784177898;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6M7152Ey+cLEt8trzGQhwm7E7uUgPw9+yf5f13TRVxQ=;
 b=iPjBclHF2VMZNWgMrYmA5l34GEywOkFhtljgJ8OXKGtwFpdt95o/wRF9cWvQivLV8J
 QTowuF1qocZwuzn1UfWmmEn8uza5XJkbiyG2uEH+CR2yxVKrPzGqHSGBkA80gWFUodjM
 OOe3qnaNbXOxa34FZVOdL3Swopr3pV0X0bB1OY/I89emhrqJks6x+4945OTvN7oW9EOP
 ST+zE8Z2PR/qtyxZa8xDunRqP+jcLRvQh/K/ufVQv3+Zl5uQty2Uee+QQI69O4ZdeqPf
 qZYyOgErjoghQOm9Hl6PJsUdWmoXSfLHlL8Ns4O244kwTBx4DY6nqhXglhBRmtcaiBi5
 fttQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RolzlDjHDD0wsTEswVeNkPYH+BkOpVbBcs4Z/lNBLi9ZB514C3N2OWf2dJfQn1jumgHvKvRH3ZlTv/h@nongnu.org
X-Gm-Message-State: AOJu0YzZhsoftegky8iGVeRozRLoOduzufXovxVIPZNOXBsO74zZCJ+K
 TyEKrfNZ867qTHF23L8JmYFVFnGfcyujVec9Q1vu/tRVgNJvWuGjalm+IaA4gKfw047E4Gbz+t6
 Bdak8K8XLTSGvbh8rlHT7j9rjhyeZvjs=
X-Gm-Gg: AfdE7cnWm08wAj+lMDSreJ9meZa92j+PumIWSxPGKGGHb1Rh9fGcqsEGF+rDZNixYaN
 ay9g9PZMSxKYIPdlke/u0GNDZkBnHcsY84k+GyJm7kmLotP9tAQfZbUVtPG4SdYI4Q+jhYMpuTr
 iK3K2jiDuR3EAiiorZWnqB/07VZJWgge2UGyfy6RM1zhF5UPOGTYIQI37xeFYt0mJQir5g3V4Pv
 FL+QDDY0RpxyLpKsntFLo1Nh/sHU5QjW+hkMeTNg7P0Tt2BzSDcvoKZM6AGQFz83QpHEMp1HaVD
 qtLP4ckMoTCCHBQFzHA4IALrgP0n/ebD54N81A==
X-Received: by 2002:a05:6402:320c:b0:698:b9ca:e662 with SMTP id
 4fb4d7f45d1cf-69ab4453bb1mr2302494a12.6.1783573097867; Wed, 08 Jul 2026
 21:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260707091039.2574638-1-frank.chang@sifive.com>
In-Reply-To: <20260707091039.2574638-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Jul 2026 14:57:51 +1000
X-Gm-Features: AUfX_myY6X8vr7HbYLrAXMhBWylHKAwonF1jcsVNDJOdMVgSaySvkcpL-cA3kWc
Message-ID: <CAKmqyKNVo-rdOtN0t9XzRB3teF6nNEgh_twkf9s8zX2q0dPU=w@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] target/riscv: Support the true Zicclsm extension
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, Jul 7, 2026 at 7:11=E2=80=AFPM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Support the true Zicclsm extension so that we can trap misaligned accesse=
s
> when Zicclsm is disabled.
>
> To enable/disable Zicclsm, simply set zicclsm=3D[true|false], e.g.:
>   -cpu rv64,zicclsm=3D[true|false]
>
> QEMU will raise a misaligned load/store exception when executing misalign=
ed
> load/store instructions if Zicclsm is disabled.
>
> Changelog:
>   v4:
>     * Align ROM reset vector data at 8-byte aligned offsets.
>   v3:
>     * Enable Zicclsm for the compatible CPUs.
>     * Rebase to the latest riscv-to-apply.next.
>   v2:
>     * Use (size_memop(size) | mo_endian_env(env)) to calculate MemOp.
>     * Use (log2_esz << MO_ASHIFT) to calculate aligment MemOp for
>       vector load/store whole register instructions.
>
> Frank Chang (6):
>   target/riscv: Add Zicclsm CPU option
>   target/riscv: Support raising misaligned exceptions for scalar
>     loads/stores
>   target/riscv: Support raising misaligned exceptions for vector
>     loads/stores
>   target/riscv: Enable Zicclsm for the compatible CPUs
>   hw/riscv: sifive_u: Align ROM reset vector data
>   target/riscv: Update Zicclsm ISA string and expose it as a CPU
>     property

Hmmm.... Still seeing failures

556/556 qemu:func-quick+func-riscv64 / func-riscv64-opensbi
               TIMEOUT         90.02s   killed by signal 15 SIGTERM
>>> LD_LIBRARY_PATH=3D/var/mnt/scratch/alistair/software/qemu/build/contrib=
/plugins:/var/mnt/scratch/alistair/software/qemu/build/tests/tcg/plugins MS=
AN_OPTIO
NS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summary=3D1:print_stacktrac=
e=3D1
QEMU_TEST_QEMU_BINARY=3D/var/mnt/scratch/alistair/software/qemu/build/qemu-=
system-riscv
64 RUST_BACKTRACE=3D1
MESON_BUILD_ROOT=3D/var/mnt/scratch/alistair/software/qemu/build
UBSAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summary=3D1:prin=
t_stac
ktrace=3D1 ASAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summar=
y=3D1
MESON_TEST_ITERATION=3D1 MALLOC_PERTURB_=3D7
QEMU_TEST_QEMU_IMG=3D/var/mnt/scratch/alistair
/software/qemu/build/qemu-img QEMU_TEST_GDB=3D/usr/bin/gdb
PYTHONPATH=3D/var/mnt/scratch/alistair/software/qemu/python:/var/mnt/scratc=
h/alistair/software/qemu/t
ests/functional
/var/mnt/scratch/alistair/software/qemu/build/pyvenv/bin/python3
/var/mnt/scratch/alistair/software/qemu/tests/functional/riscv64/test_opens
bi.py


Summary of Failures:

556/556 qemu:func-quick+func-riscv64 / func-riscv64-opensbi
      TIMEOUT         90.02s   killed by signal 15 SIGTERM


Alistair

>
>  hw/riscv/sifive_u.c                     | 11 +++--
>  target/riscv/cpu.c                      |  9 +++-
>  target/riscv/cpu_cfg_fields.h.inc       |  2 +
>  target/riscv/insn_trans/trans_rvi.c.inc |  6 +++
>  target/riscv/insn_trans/trans_rvv.c.inc | 18 +++++--
>  target/riscv/vector_helper.c            | 65 +++++++++++++++++++------
>  6 files changed, 87 insertions(+), 24 deletions(-)
>
> --
> 2.43.0
>
>

