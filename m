Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf2GF-0000QZ-7D
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 11:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf2GD-0000Lk-FU; Mon, 25 Oct 2021 11:51:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mf2GA-0008Ks-Ss; Mon, 25 Oct 2021 11:51:40 -0400
Received: by mail-wr1-x433.google.com with SMTP id d13so11181377wrf.11;
 Mon, 25 Oct 2021 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=656wdzNzX00V2W0gAMbEWimbNkbEoxWSneX1ZyFw2Cw=;
 b=G40g3BxdfKJ1pElTOEjj+CHOZBxI5InZwAbhhihGr3j/9NKQb5Ui4W46VqEwEIQXQP
 t0rE4FQ7681gDnIt8EfDs5YhyGNhauWhyK+VpmHr4jCdGcD+5kfCYvJoAvLAA5lkfaUv
 slSfvp940DZ6zCTAQ8DSRIilgVcr6x6xcnW02jKEAJnNe8Nz5psybfbq9WCmjSVgvOnP
 FESyMEaOUDovM4b2rzx56/dgYcMM+7TMd8bHQlrKz1qphOzHoE7/snk/0gCzl86+rLhU
 ZpIxxN76vSHglcs8/ekZuFnPBEvdMiusy0K9FOaCs8H251uxLrnC19PqITwUxb9rr7MG
 iduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=656wdzNzX00V2W0gAMbEWimbNkbEoxWSneX1ZyFw2Cw=;
 b=TeJG2KKriBRayR0y9v0Ny+Rc8qOpIYOuhKkq7pmw9M0F83H8lL+6x0n0ToZzsHb3x5
 ItoSXy6YS0DbqUwhSKuA8CsMdgYjt3oimc4LJVBB6htDC+NzI/GJsuvXwffsafgqkUAH
 hDLM4as5Gl95J1UXGDQjE76w3NeGeJ6zuH3+RfifE9/e8Dh7FKJey73IrBNPrMVndRAF
 iTG6Bv6rExnc1OtrfkDe3+gUKGHeO0A4DeAUrJbipL7Z+ip5OhJGo69x6YQnZky20kBI
 kG8lOiiYzG9LQOhFc32SehPRTIOMhzrOW0U+0vIfvtz8oG0WnhUdXQFB8OvcaILeYnVI
 T7Cw==
X-Gm-Message-State: AOAM533zcVHPHmvbGr0WAeoZcCpvGRgZaJDIV41SGhPC4gQ3nZOsEQpL
 uOP2CiCBnRjJQV6GgPX4OPs=
X-Google-Smtp-Source: ABdhPJwNAg1Zk1NIva6NRaou3dSe5Br2vvPXQC/aOIrSOGgazQ4ysvoXAeTYOPIzWxedwpWR0Fl+yQ==
X-Received: by 2002:adf:a183:: with SMTP id u3mr24540999wru.330.1635177097023; 
 Mon, 25 Oct 2021 08:51:37 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p4sm5829435wre.29.2021.10.25.08.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 08:51:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <9f14895f-5c77-ec3d-d403-08dc9ea0479a@amsat.org>
Date: Mon, 25 Oct 2021 17:51:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 04/17] target/riscv: separation of bitwise logic and
 aritmetic helpers
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-5-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211025122818.168890-5-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.846,
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
X-List-Received-Date: Mon, 25 Oct 2021 15:51:41 -0000

On 10/25/21 14:28, Frédéric Pétrot wrote:
> Introduction of a gen_logic function for bitwise logic to implement
> instructions in which not propagation of information occurs between bits and
> use of this function on the bitwise instructions.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c                | 27 +++++++++++++++++++++++++
>  target/riscv/insn_trans/trans_rvb.c.inc |  6 +++---
>  target/riscv/insn_trans/trans_rvi.c.inc | 12 +++++------
>  3 files changed, 36 insertions(+), 9 deletions(-)

Typo "arithmetic" in subject.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

