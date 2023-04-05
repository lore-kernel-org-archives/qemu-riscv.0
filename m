Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjuHA-0001KR-Cd
	for mharc-qemu-riscv@gnu.org; Tue, 04 Apr 2023 23:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuH8-0001JP-DQ; Tue, 04 Apr 2023 23:57:34 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuGz-0000KQ-5Y; Tue, 04 Apr 2023 23:57:28 -0400
Received: by mail-ua1-x92f.google.com with SMTP id q8so17040969uas.7;
 Tue, 04 Apr 2023 20:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680667043;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UqrrtYKD/J3Wrz2+CyQNkEETEFJBRHXSHuG4HH0J3us=;
 b=HVjtXH31FS72KYfVisbrE71oyebFTI6dpYOV9U+W7VIDSQGIejaHM/vtzyYKvWkQeT
 bucy0a5sLQ7x1UD1P6Rpr8Zpvqp+NGDEYB82ZeTZDWk5SzGPWQQ51ePJWEWWk+ghUBGu
 lytY0QRAA7oHJMlPB9uHfD1iXcPVXz2iYgTZc6dL/CVN2sAHLlAkioWmUiPrFYYXwIww
 OkWTVo2pmeOhXCbrn9H8GGW7G0q3axAL7a8UEWWUfQPTxz/Q8N2pgNJJ49dJbyFRkpPO
 WJmN4VG4pBC1rybYXcwkkp42edeyeqzAH2x/7pIHEQWKvwkY8bx39iBTEav4mfFnsw0i
 pkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680667043;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UqrrtYKD/J3Wrz2+CyQNkEETEFJBRHXSHuG4HH0J3us=;
 b=j6visXqwX1IfoHJTdJYArl6wMv5IKLRbXUnak3hslH8j5U02e/AhSBnWAjW8Z+38zI
 1Ul7L0WBgvzyPfY3ec0MchmI+zwDFUrD8l6rqTkhJ56/pD0+nJkqJKyqqLWuek1ann+a
 NuQg1xeKj80CkNNQgzLmHd7Idg8pVGhk/swqMwYlS7YyAxMydw+qaP+2T2ik0JogPU1/
 /ekpDQiEDF/kKmpb8EAlWM1SM8+1ynxtH9D/jSKarpmmMW8ySnr8iSmt+2p4gYnoHlP2
 hUkx/K+5kmYBfpOqN3HEF+M/bIz49gTfv1AnsCoYyimovaSkhp8PkcCDnMDopWoVzwjx
 F3+g==
X-Gm-Message-State: AAQBX9fd7X/6FJ77RW+o47JdxWlM9wzE0yNQR4wSDcwrWRNKK/Bkn9zm
 1CNOwJg655KjuAPMHOR22SPYXnZJpEaIIvN2cu8=
X-Google-Smtp-Source: AKy350Zy4ElETfthKBPE4H4gM+9HkKRie4g1SrxTDaWpm87Ps6UP9WVMmKIfLAXN0wtVuptyNL6KuvMDb7ncJby9SuE=
X-Received: by 2002:a1f:1206:0:b0:43b:ff63:e79a with SMTP id
 6-20020a1f1206000000b0043bff63e79amr3779025vks.0.1680667041804; Tue, 04 Apr
 2023 20:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230404173333.35179-1-conor@kernel.org>
In-Reply-To: <20230404173333.35179-1-conor@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 13:56:55 +1000
Message-ID: <CAKmqyKP2QKJtEhE3+7DxXF0afneZEq=28O_XJ1BMN6XvGjDtpg@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 03:57:34 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

