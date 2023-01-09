Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEuTG-0002sx-Fq
	for mharc-qemu-riscv@gnu.org; Mon, 09 Jan 2023 10:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEuTE-0002sS-18; Mon, 09 Jan 2023 10:53:56 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEuTC-0003WX-Cb; Mon, 09 Jan 2023 10:53:55 -0500
Received: by mail-ed1-x530.google.com with SMTP id z11so13198433ede.1;
 Mon, 09 Jan 2023 07:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4yqZifAL0IpQxx9YA1ZIQEJ7BSgFoZHHDy0bwIS/Mw=;
 b=JyCy0sh7WPSpIoNTVqRV9EgOwKyD4fgJ6VBO5R6Wtpgf8dG9yXPWMXbjUCGqrHzr/W
 M0m26pnhYHZzN+E3nt5CtG5IsEp4M5ivTV33clSab41JXzVHcxyKJPelqLLOXS7Fny2W
 CNix+VHZTRFZQTshX1kMBlgxhHSYYQ2jzdz0NK8GqaXXNg/QM4KNOCcxU5u1xv/U6Rbc
 17kxZoH+9pirJoYAIi05KgaCbSkU8eUb3I3QfqfRRoiENyxZCFiobIynaHbV1Bw805jb
 Vt8BDNV6NAuFUhrm8HQUvwtvEVj0sB9R0atVoXW/HpR4gV1BXDQVSd714BxX1i8DXA5w
 +ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q4yqZifAL0IpQxx9YA1ZIQEJ7BSgFoZHHDy0bwIS/Mw=;
 b=rMSmaKwhNRsrtgy3XaZXchpVTcsSfWfJRV9ptt7sD5D/UlcGIG0CSMzDxuB6SjqYJq
 0bOU1AQwDsTPQadnLs3MVsJzeNEzx4ogBB+lJQ6Fkrz9PhflApmuWzB6iAy/tP3SApFn
 fb78otqRsXGpD65s3PzZXpYfHzfXMCye8W1sys9Z4Bk5nFiWsl53iyd5cariXwMp1SYg
 W2+2oI2rqZUGCRbWEFd2J+iqUg7o6ODhczx0N8VxZLvrcXxpKwgWqb3E6n/3gzEBBKR0
 flOxQwmWL8fsZj0wXIql07EyBjwZNjui/VZuS7NYcyi8CCSi7XLcDaQn6a4gjedvRzSs
 RINg==
X-Gm-Message-State: AFqh2kqDW1sHHW791+YUm4uDrbysR1ZUR9MNrbWoyoHGoBk1r4vXEuMZ
 sRXSpQ97etSO4QlNOGueQs+sPYedxPFFGltjNQc=
X-Google-Smtp-Source: AMrXdXtmsOGkFoTKTw+R8LGRLUSlLHOsX6E7RrJlergXCHh35JjaQFCXFAaWKTxt1K/9bgqRKcuVQluYZvXVjl+CQbA=
X-Received: by 2002:a05:6402:2895:b0:499:c172:c6d with SMTP id
 eg21-20020a056402289500b00499c1720c6dmr72609edb.193.1673279632201; Mon, 09
 Jan 2023 07:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20230109152655.340114-1-bmeng@tinylab.org>
 <6e3de50d-38d9-b5ba-dac4-91352be8b96b@linaro.org>
In-Reply-To: <6e3de50d-38d9-b5ba-dac4-91352be8b96b@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 9 Jan 2023 23:53:41 +0800
Message-ID: <CAEUhbmUmx1mc5ngrTJS48rDbh56_vrTP86aVuSgrdKvwopc_OQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Use TARGET_FMT_lx for env->mhartid
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 09 Jan 2023 15:53:56 -0000

On Mon, Jan 9, 2023 at 11:48 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 9/1/23 16:26, Bin Meng wrote:
> > env->mhartid is currently casted to long before printed, which drops
> > the high 32-bit for rv64 on 32-bit host. Use TARGET_FMT_lx instead.
>
> Oh, a 32-bit host user!
>
> > Signed-off-by: Bin Meng <bmeng@tinylab.org>
> > ---
> >
> >   target/riscv/cpu.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index cc75ca7667..a5ed6d3f63 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -660,9 +660,9 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
> >               (env->priv_ver < isa_edata_arr[i].min_version)) {
> >               isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> >   #ifndef CONFIG_USER_ONLY
> > -            warn_report("disabling %s extension for hart 0x%lx because=
 "
> > -                        "privilege spec version does not match",
> > -                        isa_edata_arr[i].name, (unsigned long)env->mha=
rtid);
> > +            warn_report("disabling %s extension for hart 0x" TARGET_FM=
T_lx
> > +                        " because privilege spec version does not matc=
h",
> > +                        isa_edata_arr[i].name, env->mhartid);
>
> Could we cast it to vaddr instead? I'm trying to remove target_[u]long
> from hw/ and restrict it to the target/ directory. Per "exec/cpu-common.h=
":
>
>   /**
>    * vaddr:
>    * Type wide enough to contain any #target_ulong virtual address.
>    */
>   typedef uint64_t vaddr;
>
> Alternatively, since this value has to be accessed out of target/,
> can we change its type to vaddr in CPURISCVState?
>

Technically it does not represent a virtual address but a target
dependent register that can be 32-bit or 64-bit. Change env->mhartid
to vaddr looks weird to me.

Regards,
Bin

