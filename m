Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jb9dz-0001Xu-Sz
	for mharc-qemu-riscv@gnu.org; Tue, 19 May 2020 17:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jb9dy-0001V3-4f; Tue, 19 May 2020 17:19:22 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:42692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jb9dx-0004Rh-Bt; Tue, 19 May 2020 17:19:21 -0400
Received: by mail-io1-xd44.google.com with SMTP id e18so781544iog.9;
 Tue, 19 May 2020 14:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AcDt0avYRKuROuwNNZTmEtdb+RjDSrmi1rZZuiHotNY=;
 b=TA7Br14lf7rbz05+XK85Q41JpgsCVyYEwncmR0nu+sBPtD8nkJe5MoggFiY7bLBLn9
 cqPe1gxvxqNmiya4qTyNgUR04asdHIu214sqK5AhcdgcBYSzYRwmKQCG5bnNaHVdkIqj
 iLKu580RriT/TmRaUfFpjLG2IYg5ovVbcx6eQGiMAivtpjum2/mHZ3OIAKP/dn/2WVv4
 jxAx1xLSElnsFnGQfUWavzEpWQ5NPtx/7A3mbTO+NE/xbR2y8VDp6slEC0/kpCR45KPi
 LhxRuFHrwY1S7WhSGYUzeTumdefck3y1b/+eaCv3l3HRIGcdX1Pa8Gl+RCAK7VT/f6yT
 TdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AcDt0avYRKuROuwNNZTmEtdb+RjDSrmi1rZZuiHotNY=;
 b=ka+hmFI4pSCUOZHSk0fvt4G5rLcEUTrOhHrIjgsF/X78JHMe/dnWrikj+ahggSpHJc
 NVs83/LoZLBn5lh3Z7G6pYsg43PVHPsI1/ZXErXkFsYr2B+Ot344AR+lq3i6e5cjaEvu
 WJGFzaM9qhbqK2wYdwH2h7gvB4DbRZDGT9ARj1FtgkZZVV+aVZY4DFGlHG6tN4LavX7Y
 au6oZl5wnJsrlqXcb495ijCC4b/WtP9UztH4fkKFZwqrqZ80qo5CShijQ/dirtfiXz98
 p+6zZVk83oq42JMFiAkxblaiIli7DHhwYjUqm0MQviTjSDwJr2/dFWGlEKFAZAe2YZ0F
 1KQQ==
X-Gm-Message-State: AOAM532VTX8D8IA4q0EiuB/r61d8yzfjPVaz7iMN49UWb7GnUltINXhb
 ZQV5Z6FNYiNBivmPqXeh+7r/Tp1Oz5EHqwlS5vY=
X-Google-Smtp-Source: ABdhPJwQ5qOwQRh7p8IcC2tfK3/QgGZXxFbI2Pbd92Gc118hJJVOotMkTAlfSDWa5DC9dnHuYRsuKQ4wxLtbUVxjPts=
X-Received: by 2002:a05:6638:dd3:: with SMTP id
 m19mr1692492jaj.106.1589923160076; 
 Tue, 19 May 2020 14:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588878640.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1588878640.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 May 2020 14:10:26 -0700
Message-ID: <CAKmqyKNEXAV+-xBsHZn1fL30sbJ8XkKZ3Lrp6nkwyYptg6e3ng@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] RTISC-V: Remove deprecated ISA, CPUs and machines
To: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 May 2020 21:19:22 -0000

On Thu, May 7, 2020 at 12:19 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> v2:
>  - Remove the CPUs and ISA seperatley
>
> Alistair Francis (3):
>   hw/riscv: spike: Remove deprecated ISA specific machines
>   target/riscv: Remove the deprecated CPUs
>   target/riscv: Drop support for ISA spec version 1.09.1

Any more comments?

Alistair

>
>  hw/riscv/spike.c                              | 217 ------------------
>  include/hw/riscv/spike.h                      |   6 +-
>  target/riscv/cpu.c                            |  30 ---
>  target/riscv/cpu.h                            |   8 -
>  target/riscv/csr.c                            |  82 ++-----
>  .../riscv/insn_trans/trans_privileged.inc.c   |   6 -
>  tests/qtest/machine-none-test.c               |   4 +-
>  7 files changed, 21 insertions(+), 332 deletions(-)
>
> --
> 2.26.2
>

