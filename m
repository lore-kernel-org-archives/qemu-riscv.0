Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdKkd-0006wj-Fe
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 19:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKkW-0006qn-CP; Wed, 20 Oct 2021 19:12:01 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:36722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKkT-0006cO-SG; Wed, 20 Oct 2021 19:11:55 -0400
Received: by mail-il1-x12d.google.com with SMTP id h10so23894331ilq.3;
 Wed, 20 Oct 2021 16:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5B1suvmEtOtbiEUEuelHq27bvqYSaTv9EDwhzwsSebQ=;
 b=iH0v2Q+KD0aMhnv+5VkGjIslsOgfTdsPcvLRZHsDotgeGRE29FtLyedaxlUwun3oBW
 Oyssv8qi3cdZr3Bx8e5i1Y1KasvEkp6Ok9TCaxndnUVK6yS6xI6/pqUw+d1jMvEgFBof
 IIMsHZdy4TbpF7mntr+RtJdKM4KkcyEYYKCbv5a2TJz0SxT99hSq+LmOGdxv9MBJ9Qgp
 ecOlyK14lpyy93A3ByHmSumdcAZ0pwN6XpfqnLq5qa5SahEOgF0Tkr7IxCFJ7RVxZbyC
 N1gj1MIO9+xkoQVu6lswRuccaggvPF/6h5th/5Ju6TkfkWOyaNlUXcgAnCuUIaau0Bd3
 9SXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5B1suvmEtOtbiEUEuelHq27bvqYSaTv9EDwhzwsSebQ=;
 b=Jn4BdUXvLKYQgnwsOc+fzjZvKrV3mV3hZGyfrzeAGDZ8uxR69aJxjWU8CYh4TgaBsn
 w3O0R5d5vw7KuT/+chvomdy9u4NB17ycMR3j8ERUSTLDsaPys2DctcTBffBUccAeMyTP
 3flR/d466b7UsgT0Nga82oZ9v8l+WwS4mJV3j47BdeBc8fdrdIts4r+xsdSlufBmxyCV
 ftfsEabAp+S7CAhgsw8lHOhzPEX2k0m+btfc8zyZ+pnuXvoRYfqkvkqAYGFft+hvyvBV
 iVPuMB6Idsb7n4f/QpvBH44PN9+AHIrbnG6x4AEpVKBgYsdjYMtLe2wtZ1XR7f5a4HUV
 uxxw==
X-Gm-Message-State: AOAM532AsyBtEcuSqzSxmelDkcExHa/vjomS5b15dHM97qDOQ0HuU6i/
 6UuHR2HXE0WB0g5q1qsWG5LJqYp1Yc/+mRK8RRsa1DvzMZn1UQ==
X-Google-Smtp-Source: ABdhPJxnRkZiJN+0guOhKiQNNNGkrJeoNTV4trHuTYcxTjA0yWyLpaWKQFq6nDkw6TPImKrcQIyCMP3zjyHgGiKYoVQ=
X-Received: by 2002:a05:6e02:214a:: with SMTP id
 d10mr1319418ilv.290.1634771512364; 
 Wed, 20 Oct 2021 16:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-4-bmeng.cn@gmail.com>
In-Reply-To: <20211020014112.7336-4-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 09:11:26 +1000
Message-ID: <CAKmqyKMDJ935US0Sy6=UC5mPuDtebmW9znKtEAUtdA_fK-M9ug@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] hw/riscv: shakti_c: Use MachineState::ram and
 MachineClass::default_ram_id
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 23:12:01 -0000

On Wed, Oct 20, 2021 at 11:46 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
>
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> (no changes since v1)
>
>  hw/riscv/shakti_c.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> index d7d1f91fa5..90e2cf609f 100644
> --- a/hw/riscv/shakti_c.c
> +++ b/hw/riscv/shakti_c.c
> @@ -45,7 +45,6 @@ static void shakti_c_machine_state_init(MachineState *m=
state)
>  {
>      ShaktiCMachineState *sms =3D RISCV_SHAKTI_MACHINE(mstate);
>      MemoryRegion *system_memory =3D get_system_memory();
> -    MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
>
>      /* Allow only Shakti C CPU for this platform */
>      if (strcmp(mstate->cpu_type, TYPE_RISCV_CPU_SHAKTI_C) !=3D 0) {
> @@ -59,11 +58,9 @@ static void shakti_c_machine_state_init(MachineState *=
mstate)
>      qdev_realize(DEVICE(&sms->soc), NULL, &error_abort);
>
>      /* register RAM */
> -    memory_region_init_ram(main_mem, NULL, "riscv.shakti.c.ram",
> -                           mstate->ram_size, &error_fatal);
>      memory_region_add_subregion(system_memory,
>                                  shakti_c_memmap[SHAKTI_C_RAM].base,
> -                                main_mem);
> +                                mstate->ram);
>
>      /* ROM reset vector */
>      riscv_setup_rom_reset_vec(mstate, &sms->soc.cpus,
> @@ -88,6 +85,7 @@ static void shakti_c_machine_class_init(ObjectClass *kl=
ass, void *data)
>      mc->desc =3D "RISC-V Board compatible with Shakti SDK";
>      mc->init =3D shakti_c_machine_state_init;
>      mc->default_cpu_type =3D TYPE_RISCV_CPU_SHAKTI_C;
> +    mc->default_ram_id =3D "riscv.shakti.c.ram";
>  }
>
>  static const TypeInfo shakti_c_machine_type_info =3D {
> --
> 2.25.1
>
>

