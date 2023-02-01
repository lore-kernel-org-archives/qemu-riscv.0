Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pN4TD-00089S-Rb
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 23:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pN4TB-00086J-MH; Tue, 31 Jan 2023 23:11:37 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pN4TA-0000or-6F; Tue, 31 Jan 2023 23:11:37 -0500
Received: by mail-ej1-x62f.google.com with SMTP id p26so36505633ejx.13;
 Tue, 31 Jan 2023 20:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=StqVRDZodeAFfNJsksDjX9dpuyZSDpXkUOOgAsHviSc=;
 b=G4WDVDQ6fk5iRtZxtVsCzblhMadnWAwh/sEiPMRcAAzmpjuZC0PyiG8KmlEfjx5Vd/
 C8lvUAUeP8RqchYHX7AYx+CJeqTlJQQhTWFgJOG6q6WQEyUG9yJnrYb/BruwBjuEvEqc
 HQtuA9CXimIO65nMXqjaQUHElQwNWVt2tlGPTWAGcW1DwBiSsSIYa9PPTe0D5JrN6NrS
 bm1bNWMyLs8HnLY8ngOKkrqD5PgTwm0u5SZKJUJ8rg1+RJmt2kMB38/Od24dKJITeqvB
 srWjbPVX1KeHOTdc1hEYuhNE0JvszWxTcsfPLNDiPc5hwqa4Rp3mdkx/5loUvUQtlyh5
 ZkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=StqVRDZodeAFfNJsksDjX9dpuyZSDpXkUOOgAsHviSc=;
 b=FHaL63uTlNo+jRjpIkYqUykcQUVuDE5uTs4DYyu45OlhrxhYr5uLie9/WTaIEFovrF
 dTuDtoQCPvN2s7rQN89ungmlXl0MMMOdHPp1HvEIdTYatFeKSxJhcT+M3H7tDNE6HaER
 TTeLXDjUhGcF3Erqu46J/8rbO1PtrBYQAmEB8n5FRSzXfhSg6xDVMAeS3LMDAGyiwKnc
 DYbXoVj81PTFukLkyeQtC3bKTd2Nf2ujiijI0Hbck/rmZvp9I/ZWdoVdDI1vmWqGDogW
 qZe3QnUGEg6vTTFvGvYMjj8kdyWMbhhsCLooVnfz1TrXgXPbw4ArSm+p20AAkXMEdybU
 CJlQ==
X-Gm-Message-State: AO0yUKXC6UHFRReQ5f4EeVlwOp4plg8EJhXg5jL7ONH3//si26spKgfy
 lIkb7qPHFxKhgevSpCBGmjmsgFU2FtF8TH97kDg=
X-Google-Smtp-Source: AK7set/kwk2FzRh4MpniwXDfC6iQbGHRT7NrybfC4rxAGXko0nJXIu6+nqcfx/FanRbEGElQewoLZFMSCWvsLp9LMk8=
X-Received: by 2002:a17:906:49da:b0:882:3e56:a854 with SMTP id
 w26-20020a17090649da00b008823e56a854mr229776ejv.263.1675224693771; Tue, 31
 Jan 2023 20:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20230131170955.752743-1-geomatsi@gmail.com>
In-Reply-To: <20230131170955.752743-1-geomatsi@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 1 Feb 2023 12:11:22 +0800
Message-ID: <CAEUhbmW7pWG0UQmNTkmV-ZjKxov5TT9+Fu5eOpNqXTdOMVokUQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: set tval for triggered watchpoints
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62f.google.com
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
X-List-Received-Date: Wed, 01 Feb 2023 04:11:37 -0000

On Wed, Feb 1, 2023 at 1:35 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>
> According to priviledged spec, if [sm]tval is written with a nonzero

typo: privileged

> value when a breakpoint exception occurs, then [sm]tval will contain
> the faulting virtual address. Set tval to hit address when breakpoint
> exception is triggered by hardware watchpoint.
>
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>
> ---
>
> v1 -> v2
> - do not set tval blindly for every breakpoint exception,
>   handle current specific case under consideration
>
>  target/riscv/cpu_helper.c | 6 ++++++
>  target/riscv/debug.c      | 1 -
>  2 files changed, 6 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

