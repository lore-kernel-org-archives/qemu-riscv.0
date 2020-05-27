Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdzJD-000550-CO
	for mharc-qemu-riscv@gnu.org; Wed, 27 May 2020 12:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jdzJB-00052y-OD; Wed, 27 May 2020 12:53:37 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:34608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jdzJA-0005br-6h; Wed, 27 May 2020 12:53:37 -0400
Received: by mail-io1-xd44.google.com with SMTP id f3so26812295ioj.1;
 Wed, 27 May 2020 09:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NyNUKP1GL3kMltgD5ZUaU1TzowdKQWg0vRQhluEWl+I=;
 b=W/hTyNIqXAOnLw1uNFJlQ0oP/4PxqXhN2wyOoLHabF4GeTHqidlC+fDl821uFTGBbt
 VaqTNWJbhN/Y7lSsOAgUc2pBIIrcCkt9TKEmxRcORHef4qJeoKhfbP68zB4KKgjRt/ER
 NGQ3pyj2xrqWCMRayGyILD2bOv7SJoYl3dp5FQCCIYP/JLhXX85F9cHpeqyczMKfk8q+
 /kU0sz97JwZBtrLkBla42TKuxjH7yQwqso3xMrvoHaCAb7qj7Umus/tS81O4Wj0DmR1L
 cqdiZr9d8xV0YsJXbQfWLi9hk85mtyftNEZ0IR4rHX8bObryASvaukanqjDHso0ZlSfB
 /jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NyNUKP1GL3kMltgD5ZUaU1TzowdKQWg0vRQhluEWl+I=;
 b=OORHVAKXUiClz/5L3qFbXpAxpAm33EXKcRJSOWaaNgd09x3ScHSovOgBoFbXNMDt4i
 BDnP9FStV8mrgjpxd3We1nUHJcP1XNMYO8wsQPwyfMfLUBnpgaO1wQBIvbqNDaZ025EU
 hAvT0RnxU+RDJ7j3Euj/73JrswOUj6tmYwDEJ+AD1KA3OWfNU1XvxpZw+rFVa/842lso
 0oRJfZqyfKQyRcG2KnlrDzL3w9JnVu+CKjM+oFnM2cZxQZSsHxSBG4GqvofyDpYrk1Zl
 x6AdI7GzIpBaVq4t9N8Uhr6thqA0QYkAtFNiXBPWliTWrZH6kqDcjsQAGVJhyFDCCAyt
 tFLg==
X-Gm-Message-State: AOAM530DQ1EQN41jXOdHbzgXRC8Ki3lJr9iPetUwbL01QhwzYllLDhAO
 hDOS4Fpobzm0G/yryImTlknVdpncAd27VKc8HA0=
X-Google-Smtp-Source: ABdhPJzBR6BUCc29aFnMa0ZTkGJnuE2CgGgMxlyHfYQQ2EfPRcxCNyljP4JD+zGsCnwpPcQKXEGpfr51XxrQSoNT2/s=
X-Received: by 2002:a02:b782:: with SMTP id f2mr6412145jam.91.1590598414719;
 Wed, 27 May 2020 09:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589923785.git.alistair.francis@wdc.com>
 <24ba2634ff761e7a1e6b28b15929b03db3f59008.1589923785.git.alistair.francis@wdc.com>
 <2c695b2b-a292-61ff-bd2b-5f2ff2b48271@c-sky.com>
 <CAKmqyKMKGpNT+RRnNWCTzVjYppEpE+T2DZVDFiVcvnecYtu2kQ@mail.gmail.com>
 <27acc4bd-ae60-ad7e-0efb-105d4c20e132@c-sky.com>
In-Reply-To: <27acc4bd-ae60-ad7e-0efb-105d4c20e132@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 May 2020 09:44:34 -0700
Message-ID: <CAKmqyKP=vPtx3oZ40vB_UhP22HtdKp25TSA+ki04=HoFdSEtYQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] target/riscv: Add the lowRISC Ibex CPU
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
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
X-List-Received-Date: Wed, 27 May 2020 16:53:38 -0000

On Tue, May 26, 2020 at 6:58 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
>
> On 2020/5/27 1:12, Alistair Francis wrote:
> > On Fri, May 22, 2020 at 12:51 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >>
> >>
> >> On 2020/5/20 5:31, Alistair Francis wrote:
> >>> Ibex is a small and efficient, 32-bit, in-order RISC-V core with
> >>> a 2-stage pipeline that implements the RV32IMC instruction set
> >>> architecture.
> >>>
> >>> For more details on lowRISC see here:
> >>> https://github.com/lowRISC/ibex
> >>>
> >>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >>> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> >>> ---
> >>>    target/riscv/cpu.h |  1 +
> >>>    target/riscv/cpu.c | 10 ++++++++++
> >>>    2 files changed, 11 insertions(+)
> >>>
> >>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >>> index d0e7f5b9c5..8733d7467f 100644
> >>> --- a/target/riscv/cpu.h
> >>> +++ b/target/riscv/cpu.h
> >>> @@ -35,6 +35,7 @@
> >>>    #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
> >>>    #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
> >>>    #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
> >>> +#define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
> >>>    #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
> >>>    #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
> >>>    #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
> >>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >>> index 5eb3c02735..eb2bbc87ae 100644
> >>> --- a/target/riscv/cpu.c
> >>> +++ b/target/riscv/cpu.c
> >>> @@ -156,6 +156,15 @@ static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
> >>>        set_feature(env, RISCV_FEATURE_PMP);
> >>>    }
> >>>
> >>> +static void rv32imcu_nommu_cpu_init(Object *obj)
> >>> +{
> >>> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> >>> +    set_misa(env, RV32 | RVI | RVM | RVC | RVU);
> >>> +    set_priv_version(env, PRIV_VERSION_1_10_0);
> >>> +    set_resetvec(env, 0x8090);
> >> Hi Alistair,
> >>
> >> I see all RISC-V cpus  have an reset vector which acts as the first pc
> >> when machine boots up.
> >> However, the first pc is more like an attribute of a machine, not a cpu.
> > In general it seems to be a CPU property. I assume that some CPUs
> > would allow the reset vector to be selectable though, in which case it
> > becomes a board property.
> >
> >> Another reason is that the cpu names are a combination of ISA.
> >> Then the cpus from different vendors may have same ISA, with different
> >> reset vectors.
> >>
> >> Do you think so?
> > If you are worried about CPUs with different vectors we could always
> > make it a property in the future and have boards override it. I don't
> > think we need that yet (only 1 CPU is different) but it is an easy
> > future change.
> I think your are right. A cpu reset vector property is better. If there
> is a conflict in the future,
> we can add the property there.
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Great! Thanks :)

Alistair

>
> Zhiwei

