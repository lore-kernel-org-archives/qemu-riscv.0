Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pju34-0007B0-CT
	for mharc-qemu-riscv@gnu.org; Tue, 04 Apr 2023 23:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pju2z-0007AX-V2; Tue, 04 Apr 2023 23:42:59 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pju2x-0004v9-9o; Tue, 04 Apr 2023 23:42:57 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id i10so30311560vss.5;
 Tue, 04 Apr 2023 20:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680666172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1zLExsQa9VUs95XWhIrQqjXIniwHJNLquniu4RJD5T8=;
 b=TNgI/uW+trCeR7VuGCkfKXkC6VO0DIc+Sl9MWXYWg3RGtuzohrwwXwiqKDhgbLGzam
 F6CbkujYzGSRz+rx/BUfgS9ufiOq3vpLpJWkZfHh1QVZ+aK2kuVn/v+4Q5ZicVaA1x5y
 NRsiq9oL9XGQsVXeIYddxxuxqwP2mAS8zxK1tedOZjQ+ofUuWkDp4qwAWCCZcIxUkbF9
 VmV+hnRdywvaLrO/VJAuNV4/XVZFuUrZ7wzsWUOOVhsM4mtX9mW/fN+DrBcBAkjTdr4o
 WAX5UXotsHB0JuSHgrzTZNXPVanJRYwl9HDhtu92b/X1NOgNAvDWFb8TQHwBkobuXQY9
 ZClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680666172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1zLExsQa9VUs95XWhIrQqjXIniwHJNLquniu4RJD5T8=;
 b=taStEX/UYoQvkit+yPJ5a+FhGMw4ttKdlK7H9pptolt+B8jPUWzpt/OEZ5jVpELtBh
 tGapXGrp2HcMktCTHGw6ASfASiSkgyM94XXwrOjEFTTfS/sUo1JrGrLUkETkjfFPqUQU
 LtGy9ibMvdPUHxZ6BfOt/Vn/amfzX/rGzAQgEBPYKwyy1BIxNCSXAGlInBv27KODpTsO
 9SfNHSyRBUxWRaFGEnvWUJ/1eVtpsYFfXDNKP42Ec/zv1oU40p/9MA8htEVoc2wQDeg1
 riJ/MfxAv3EoHBf6ajLwdHuNbeEhlquARrm6oFPeg07IcpFAClto1OL3QfuzU15JyBT7
 JbNQ==
X-Gm-Message-State: AAQBX9fd8Prs0VpAYkHi4aQaaw6IOPLUQSfMfuQs6KrGyLDE51dKhHgZ
 H/lu40sXe9WCQQXiqSs1KtNlap2gTk0ZhlSzM3I+Qxde+hA=
X-Google-Smtp-Source: AKy350Z2MWp4Gh9LloSIOociZGbu8XtO/E113NIEnIdDV9vnJB9Jtmfmle53vkwWdC/ciFqb2rhpyS+kCpq2qRkheIQ=
X-Received: by 2002:a67:c890:0:b0:425:8e57:7bfd with SMTP id
 v16-20020a67c890000000b004258e577bfdmr3539565vsk.3.1680666171875; Tue, 04 Apr
 2023 20:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230404173333.35179-1-conor@kernel.org>
In-Reply-To: <20230404173333.35179-1-conor@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 13:42:25 +1000
Message-ID: <CAKmqyKMo4izPFZa_=U0BQWvkPnNyb9zJFAuK2tVhK1FedmDtmw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix invalid riscv,
 event-to-mhpmcounters entry
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 03:42:59 -0000

On Wed, Apr 5, 2023 at 3:35=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> dt-validate complains:
> > soc: pmu: {'riscv,event-to-mhpmcounters':
> > [[1, 1, 524281], [2, 2, 524284], [65561, 65561, 524280],
> > [65563, 65563, 524280], [65569, 65569, 524280], [0, 0, 0], [0, 0]],
> > pmu: riscv,event-to-mhpmcounters:6: [0, 0] is too short
>
> There are bogus 0 entries added at the end, of which one is of
> insufficient length. This happens because only 15 of
> fdt_event_ctr_map[]'s 20 elements are populated & qemu_fdt_setprop() is
> called using the size of the array.
> Reduce the array to 15 elements to make the error go away.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> I dunno if I am missing something intentional here, feel free to scream
> if so!
> ---
>  target/riscv/pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index b8e56d2b7b..fa1e1484c2 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -35,7 +35,7 @@
>   */
>  void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name=
)
>  {
> -    uint32_t fdt_event_ctr_map[20] =3D {};
> +    uint32_t fdt_event_ctr_map[15] =3D {};
>      uint32_t cmask;
>
>      /* All the programmable counters can map to any event */
> --
> 2.39.2
>
>

