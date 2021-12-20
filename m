Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzKth-00062D-Jp
	for mharc-qemu-riscv@gnu.org; Mon, 20 Dec 2021 10:48:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzKtf-0005xG-UT; Mon, 20 Dec 2021 10:48:19 -0500
Received: from [2607:f8b0:4864:20::936] (port=42853
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzKte-0003aK-6i; Mon, 20 Dec 2021 10:48:19 -0500
Received: by mail-ua1-x936.google.com with SMTP id t13so18417915uad.9;
 Mon, 20 Dec 2021 07:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eRwpW0zhQeUBvdYiXpiKE27jw6XbT23AuDJWyED2G+o=;
 b=KYTrgl7wqJ4TBwJDkZnMJS2O+tLaMgIypLXruZmQ2zyLNwimJvLEopzgqA/iGWR7DV
 Sjv+SVrW7YFf3mD1GvDbTA0/pGFmXJwVLtrbBKj+4G8XUIhLFXurHNAgpSsD4AeQ2B9t
 K0jEt+jvUwPMRlus7AkGK7VIPGp24ZvsfIQsMlWYIdE34U7CXuI8otV57m8bWPQH4Zjd
 H5ZHD2hBPBIc3NAyZEkD4VsJ8BSqcV0kCywNCmKARlRm/NCy94vKeFcuC2VPBDOZYmm/
 T0WsGCK0fd99bpjlJ2l9OzR1+NpuQ+7OiEy/l3pOeDzeDdqGBbqSUzXezYeejOJB5kUa
 3JRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eRwpW0zhQeUBvdYiXpiKE27jw6XbT23AuDJWyED2G+o=;
 b=Co4yT3VgqR1pE+f8Z/CURrnKBdno2IjlLX/bt29sm/hF2QMBZPIc3UL6rqu4AKqIRL
 2QsWa0rUHW8Snw1uupM8YkgdTWNJxD9zPJO1CPqwZ85dEAxmwZNPXRIDndh6nrfrKCtb
 582Uu2njzzCplw1gvwqjqxVnBWhh4y2AX1feTj5ky5sFZ3NJ6GYffFB3wQob6BQctKCJ
 Rno2Dx3LK/wxCU4n61qBXsPEmFOo2+/YjeXPoC1H8cOk9w8UFAKB3FYVFMwe/9Qb5h3U
 P/IenpbF06xXuonFXrkbiMa1FmHIM9NG3V4gAVbyhRkx7wDwoYqKB9JQx0dpSNuyokuI
 0bYg==
X-Gm-Message-State: AOAM530r0BqfrNQbOENEqPcwSkLBjzEOsWOM5VYnMYztftwsAwsK0kmV
 4tCd1Siy2ZxDp1toOScmv3GrNHxkFIleVJivQjT2FQYC7/U=
X-Google-Smtp-Source: ABdhPJzSxxxk8NQbI14OSRJ6y+ndDpyM1wEZTjca3RzzpQsp8YvxYLBaCZImUbdeIxg1YZ0SU0tCRxI2qpXXapJWkac=
X-Received: by 2002:a25:8804:: with SMTP id c4mr20687381ybl.148.1639986722658; 
 Sun, 19 Dec 2021 23:52:02 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-10-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211216045427.757779-10-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 20 Dec 2021 15:51:51 +0800
Message-ID: <CAEUhbmVpGwjqvhLN1LCY3EokL9_a_v9okL=ZwUb_JYMZcvv3zw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] hw/riscv: virt: Set the clock-frequency
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 20 Dec 2021 15:48:20 -0000

On Thu, Dec 16, 2021 at 12:55 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> As per the device tree specification let's set the clock-frequency for
> the virt CPUs.
>
> QEMU doesn't really have an exact clock, so let's just 1000000 as it's a
> nice round number and matches the sifive_u CLINT_TIMEBASE_FREQ.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/472 (RISC-V virt)

I tend to think this issue is not valid, as the comment in the issue
says the value should reflect the running frequency.

Note the "clock-frequency" was once in the codes but was intentionally
removed before because it is not needed:

See commit 7ae05377b85f (" riscv: hw: Drop "clock-frequency" property
of cpu nodes")

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3af074148e..41a85cfc60 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -202,6 +202,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>          qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
>              s->soc[socket].hartid_base + cpu);
>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu");
> +        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "clock-frequency", 1000000);
>          riscv_socket_fdt_write_id(mc, mc->fdt, cpu_name, socket);
>          qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle);

Regards,
Bin

