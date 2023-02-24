Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVdBe-0007Lv-0S
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 13:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVdBZ-0007LG-AO
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 13:52:50 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVdBX-0007u5-50
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 13:52:49 -0500
Received: by mail-pj1-x102c.google.com with SMTP id u10so17417085pjc.5
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 10:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QYAvMRnEOrYHcJ/zzAzrW/bNwasKcwx4YV7c5enUUFk=;
 b=Y8ozZMI8r0DV5lA/Dljn9UuAPC8a5KFCjFRKYOvfTHxuLkf9mJ64ShAYZVB7aC+N6a
 xHPXz9TyMj8hh2J42GcaeIYcTpd1xl6wqglCH8fw+PNyD48Oa/s1ltNLtUHl1cs9DFVO
 elkj3KeMotlgHorm7uDAl/6/wvemCLgcL3OC4u45K9ugzvZ3D0lFuCm5lTYwkBWc5AZT
 zCL+Ba+MlGjJBFeKRl4yvPHHd4thj8Y7sf6YrSxdfMC4BwXIUnxPUAHFwiHGWfPQ8Ot/
 N+x5fXr0LMHFhQ5c1NHol+p4pIApZj7c+KqEh8/raeSBQ39LS+RmzE2qcBHqeuCf5JEf
 i2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QYAvMRnEOrYHcJ/zzAzrW/bNwasKcwx4YV7c5enUUFk=;
 b=EYWFLSJRWxe6w26EqEMPkTqeh4Gs3XwV1aUkddskchB9eNopj/gYjC+WJClj5K5Mh+
 kVb7AlSu065VqcPG9OJMexaw00UkHiWY10+EfJQQ1/Uj7QeV2j1e2sUOc1Y5aZWgVqlu
 p9DicVCcA2GQOntwCMLfQW2HMYdjQ+V+h4ioP4Od57pwoJn3oqnCsBqgm7pHhW00XyK6
 UrrXJuv+xyU6RRVIb1NT5701XrlXvuPs4QnMn/wKD3StuKJwKsNH+L5ub+drkfHVay30
 yB/97kw7JHeVvyAKhWDvTbzF9V/UsHpA6Tf5Qf9AHHW89rzpCwruZe5BcTeMonz1uIuJ
 5Liw==
X-Gm-Message-State: AO0yUKV3jHUD7tcciD83puyYPxMvupdNPTuOS+WxO2Evsd8sNrbvYGM5
 l5o3GDwOhWDwzKvg2ZNabxkMUq016BJHoCviz4Ifxg==
X-Google-Smtp-Source: AK7set+nrNMeJhPcTSt4hG0r4mOyQhlWUFkQa4zPVYzAuuZf977xGkp7w+q0kOkphlSa8t2my8eggIqsl9X/d1rxkIo=
X-Received: by 2002:a17:902:a386:b0:198:ec76:e249 with SMTP id
 x6-20020a170902a38600b00198ec76e249mr3443552pla.13.1677264765610; Fri, 24 Feb
 2023 10:52:45 -0800 (PST)
MIME-Version: 1.0
References: <mhng-61abd1f7-4d76-42de-85b2-42466ec0673f@palmer-ri-x1c9a>
 <ffe100bb-b2b9-1c74-5b66-4f7ebee6d5ee@redhat.com>
In-Reply-To: <ffe100bb-b2b9-1c74-5b66-4f7ebee6d5ee@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 18:52:34 +0000
Message-ID: <CAFEAcA_OYJFTXxVjmKs8WAHosnqUzu4o4uN3WU21w29O2=tzjg@mail.gmail.com>
Subject: Re: [PULL 0/9] Fourth RISC-V PR for QEMU 8.0
To: Thomas Huth <thuth@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alex.bennee@linaro.org,
 bmeng@tinylab.org, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Fri, 24 Feb 2023 18:52:51 -0000

On Fri, 24 Feb 2023 at 06:56, Thomas Huth <thuth@redhat.com> wrote:
>
>   Hi!
>
> On 23/02/2023 23.49, Palmer Dabbelt wrote:
> > Nobody's replied, so I'm inclined to just drop the OpenSBI bump and re-send
> > the PR.  At least that way we can avoid getting blocked on the CI issues.
> > There's some more in flight so there'll probably be a 5th round before the
> > freeze either way, at least this way the stuff that works can avoid getting
> > blocked.
>
> Please note that pull requests are currently not processed
> anyway ('til March 1st), see:
>
>   https://lore.kernel.org/qemu-devel/CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com/

I've been able to do some pullreq processing with a combination
of the private CI runners, my personal gitlab account's CI minute
allowance, and local ad-hoc jobs. So probably best not to wait
til March 1st before sending.

thanks
-- PMM

