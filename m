Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXU4Z-0006At-J9
	for mharc-qemu-riscv@gnu.org; Tue, 27 Oct 2020 14:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXU4Y-00068T-5z; Tue, 27 Oct 2020 14:51:54 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:38110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXU4W-0007Jw-F0; Tue, 27 Oct 2020 14:51:53 -0400
Received: by mail-io1-xd42.google.com with SMTP id y20so2698506iod.5;
 Tue, 27 Oct 2020 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zOZ+hdd2g58yuw923eoo/U6s5xjAdqR14tgcO8FO/YU=;
 b=UV1GoRn2OT9DT7PopoGsz/vIdXB3dCjcWTk7U7tOe27j6mkcR+TzFbGUdbom1dlaZG
 nwyj5IaVilC98UUVWtsUkqmLpD5UrbS3sVFMthT6n0Y2VoMpjnhqr7zuNB4ckWL+qJu9
 Mnwh0smcRmJGBH4cxs4WBQPPkCuz3yqPBFTVKACi7FRZ4y/6WPKYZLYBNIea5W7+1dtB
 ieIu0TKmGvZsBe3dltyEXC5cbmwHcSMRXXrqFGYLl+mXQ/c729QAYHZmninuQb4DsKWT
 GTmxHfndzTen3zovbQDXROAdiWFWA6DYOQVDYLmZjtWoCv1ArErOCYvKm5aUqUhQFkbd
 ICfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zOZ+hdd2g58yuw923eoo/U6s5xjAdqR14tgcO8FO/YU=;
 b=tK/e5bCzJ3C2X4lNkyuX/Qk8w8hwFquoU+pZc0JiDtflGBILBnLkrDeodz06wUHzIO
 JXQ87PM/h74L8PHbSorlp70uDMSaXY9CgwUXTvKjT15vreC5oKPiPqyTQ0UNXnbI2gYq
 7JOJIXT85kRcWedVvJ3VlDA0qTPdPcftB//+6jo9g5Fm+QxY++b3qPvzmAtDdJDa/gR/
 w3a4hyfENdsIwJQu7fENdkpT2WWlPF883qk9K+cD/RigKoanyY7Szy5Sl726BSZ47/SM
 p3t5n7cuP2P/1RnBlcjr7G9hlhVjRWjMVHAG3zJM5Bl2lLO3Tca+OaIovO2ns3IjR/bf
 tTGQ==
X-Gm-Message-State: AOAM531zSYOuxVaLGRytwAh64Q20XE5E2EXMfkx9JH7J1inJEq9Pc67t
 EoczWDsoSbH9bqRoISYEdm7l0xieKNn7DJr/eu0=
X-Google-Smtp-Source: ABdhPJyICJfBk1yxt/ac4awGO+bBDbXc0joAamWBl6cTluQ+LRPSYd1c45nIAqhslxGrGHVy74dW3mf3zotQTnUaWSc=
X-Received: by 2002:a05:6602:2d4e:: with SMTP id
 d14mr3444987iow.105.1603824711003; 
 Tue, 27 Oct 2020 11:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201026115530.304-1-jiangyifei@huawei.com>
 <20201026115530.304-2-jiangyifei@huawei.com>
 <91908cb7-0677-96f1-327d-e69f8094fec3@linaro.org>
In-Reply-To: <91908cb7-0677-96f1-327d-e69f8094fec3@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Oct 2020 11:40:01 -0700
Message-ID: <CAKmqyKMbk50m+tVZiFmOgvWvTpMCyOXpBP2CMcjf=YMQOzVi3w@mail.gmail.com>
Subject: Re: [PATCH V4 1/6] target/riscv: Merge m/vsstatus and m/vsstatush
 into one uint64_t unit
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Yifei Jiang <jiangyifei@huawei.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, yinyipeng <yinyipeng1@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Wubin (H)" <wu.wubin@huawei.com>, 
 "dengkai (A)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 27 Oct 2020 18:51:54 -0000

On Tue, Oct 27, 2020 at 11:47 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/26/20 4:55 AM, Yifei Jiang wrote:
> > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", env->mstatus);
> > +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong)env->mstatus);
>
> This is truncating mstatus to target_ulong, i.e. breaking the output for
> riscv32.  You should use PRIx64 and print the whole 64-bit value.

That is what we want to do though. For RV32 the mstatus CSR is only
32-bits, where the upper 32-bit are stored in mstatush (the top
32-bits of QEMU's internal mstatus).

Alistair

>
>
> r~
>

