Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWTti-0002oS-83
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 22:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pWTth-0002oG-Go; Sun, 26 Feb 2023 22:09:53 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pWTtf-0005eP-Cj; Sun, 26 Feb 2023 22:09:53 -0500
Received: by mail-ed1-x52c.google.com with SMTP id cy6so20155192edb.5;
 Sun, 26 Feb 2023 19:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QkdFoUhXzOVRLgUeAMJ9SY5MaTqWQgt5tx78QPodFGE=;
 b=Dlos8vBikv2BcL+hUQzt0ub2CBSnZI7Ipxq1VT0LlwUB3NrhphLs+xS5+8+UQm9Lpc
 JJutSnnV5Z+attiGbMLg4C/LfHAkhge584KaozJZshg8USKyTuHxVZa+AFRca3qBJ3Gl
 d63/DA3IMSw2CsS2ILJnK3K8Oy2zUaxWp6kGfzMd3k3lYng2pUeNsnECBbKhA7hmLcHQ
 5kWEMabE/AD7iyQKGWPe2Ljm+RAHdIqjUtGsuB3x4xkCdLEGDVRBDvPGafXVkYMZHqhb
 Dxi6fRjrM9TvA1FYJa4R9Vnm5rdVHVJPMIhyYMasdJIIkoHbL/2z4uYFuMgniRd0daul
 rEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QkdFoUhXzOVRLgUeAMJ9SY5MaTqWQgt5tx78QPodFGE=;
 b=pXCdCnLmq25TXPHQwmLZ2sskB0y1vN3hviuKefpb8Ct2Dba9AhGaCz3t4ASAXwsMnB
 gS9tZY6rPOjDtnalqU2D35p2U3n3ui2F6qj/79OWIuciupkOSg1mtqZU3BWonZF5MxWT
 NfvZ2N8ddQZw0Id9eVOLEb1hWHN5LkZ3pQs6qmL8rHE9Nmy0NSVcUacEPK3u7uKV1JoI
 5EAKQggt8kcsJL36pasmiTiE/a7hyDSiHgAvRtqEXtzJnWvZpmK5n0niEzVDa1bqqr9n
 vH5olNOu18kxXls1ZPVmMa5jp2uYrnFb1gt2ImPWEE0yjK6jci7UCIhIaF+d6moE40t3
 4ZkA==
X-Gm-Message-State: AO0yUKWmflTY5s6fanxzPtdFRQ6zRtiqm0zLVkPrVOJjP3ZvcxnQImyw
 TxgDKJYHNnI02ZrHEeykOwEY1BthmuC5fyoXdiE=
X-Google-Smtp-Source: AK7set+cmzBVpmetSUelJTFKFFhyz16Oj8DndBV2eLGySNIoAyVveZn0keUItTaSmChQFPhDNuc0ic+oTTJs498j5AQ=
X-Received: by 2002:a17:907:2b09:b0:8b1:cd2e:177a with SMTP id
 gc9-20020a1709072b0900b008b1cd2e177amr15326872ejc.6.1677467388717; Sun, 26
 Feb 2023 19:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20230221061204.1658306-1-bmeng@tinylab.org>
 <3a5af4b2-21a1-ba64-df8f-349b91488206@ventanamicro.com>
In-Reply-To: <3a5af4b2-21a1-ba64-df8f-349b91488206@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 27 Feb 2023 11:09:37 +0800
Message-ID: <CAEUhbmWgayWdOJDT6XeykVs6QKyr-5c4raYj5ZDqHN8MgN=UcA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Skip re-generating DT nodes for a given DTB
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52c.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 03:09:54 -0000

On Tue, Feb 21, 2023 at 7:32=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 2/21/23 03:12, Bin Meng wrote:
> > Lanuch qemu-system-riscv64 with a given dtb for 'sifive_u' and 'virt'
> > machines, QEMU complains:
> >
> >    qemu_fdt_add_subnode: Failed to create subnode /soc: FDT_ERR_EXISTS
> >
> > The whole DT generation logic should be skipped when a given DTB is
> > present.
> >
> > Fixes: b1f19f238cae ("hw/riscv: write bootargs 'chosen' FDT after riscv=
_load_kernel()")
>
> Thanks for cleaning my mess :)
>
> I was wondering whether we should move the ms->dtb verification/load bits=
 outside of
> create_fdt(), and put it explicitly in sifive_u_machine_init() and virt_m=
achine_init().
> Like this:
>
>      /* load/create device tree*/
>      if (ms->dtb) {
>          ms->fdt =3D d(ms->dtb, &s->fdt_size);
>          if (!ms->fdt) {
>              error_report("load_device_tree() failed");
>              exit(1);
>          }
>      } else {
>          create_fdt(s, memmap);
>      }
>
>
> This looks clearer to me because create_fdt() will actually create a fdt,=
 not load or create
> a fdt. create_fdt() from spike works this way.

Yes, this makes sense.

>
> I'll leave to your discretion. The patch is already good enough as is.
>

I think we can create another patch to do the move as you suggested.
Because this patch we use a "Fixes" tag to refer to the culprit
commit, and this patch just does the minimum thing to fix that.

>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>
> > Signed-off-by: Bin Meng <bmeng@tinylab.org>
> > ---
> >
> >   hw/riscv/sifive_u.c | 1 +
> >   hw/riscv/virt.c     | 1 +
> >   2 files changed, 2 insertions(+)
> >
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index ad3bb35b34..76db5ed3dd 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -118,6 +118,7 @@ static void create_fdt(SiFiveUState *s, const MemMa=
pEntry *memmap,
> >               error_report("load_device_tree() failed");
> >               exit(1);
> >           }
> > +        return;
> >       } else {
> >           fdt =3D ms->fdt =3D create_device_tree(&fdt_size);
> >           if (!fdt) {
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 86c4adc0c9..0c7b4a1e46 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -1014,6 +1014,7 @@ static void create_fdt(RISCVVirtState *s, const M=
emMapEntry *memmap)
> >               error_report("load_device_tree() failed");
> >               exit(1);
> >           }
> > +        return;
> >       } else {
> >           ms->fdt =3D create_device_tree(&s->fdt_size);
> >           if (!ms->fdt) {
>

Regards,
Bin

