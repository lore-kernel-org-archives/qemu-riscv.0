Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnvwy-0005DL-69
	for mharc-qemu-riscv@gnu.org; Thu, 18 Nov 2021 23:56:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnvwt-0005B0-PY; Thu, 18 Nov 2021 23:56:32 -0500
Received: from [2607:f8b0:4864:20::12f] (port=43618
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnvwr-0002q6-RW; Thu, 18 Nov 2021 23:56:31 -0500
Received: by mail-il1-x12f.google.com with SMTP id s14so9045656ilv.10;
 Thu, 18 Nov 2021 20:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1vstwSfqJbYULdBaVsaKoblKA0h/t1B1j6lZWfgDUxY=;
 b=N4ESlOmxRIqKcd3KitTWcSRS0gtJTaWDUVg7TfcbBkoODlCJVqawI8grWiADfitKxh
 BJF9Hm9uW6Uz3WBQMpwHT/TLHX/6899OEsMCFIIy6OrgaR4VYxFyk6HByNjo7ZuqGkcW
 /qYAN+oMfSsiEMmsG5K67sI/pA5ny0yCCTgLtdf7LGCsBS140R+Svb3AkzmlpO2Zer9e
 AXfztbUceVUOoM9SoEBIklNT/BcibXTxQ2xbzHU5pUSmwsOpLEdyi+wd5jSVN+GV/6m7
 ckwuhpuGAtI+aLY0jNEWUbi3kGxoFY6MgC8047FT4rvarwHaakrumfX9/dkZombWXNYj
 c6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1vstwSfqJbYULdBaVsaKoblKA0h/t1B1j6lZWfgDUxY=;
 b=sdqCRYgDEXAQqPvbfOKXQ3JIekiXw7C0SgZIRxcPuyN48kZOXvnod66kLm03wJcQLr
 pEMPECMHPIDnooPM0UrqkYu3VItFf8nMlWzugH7Vk0iI7YLGB+19lElv67l4+ksbEow6
 QApopfudFh6xXCn7F8nSvVZarWTaE7Zw+YllZSbMTzQiyKHCCarPThLs5Qm5O04qZWeO
 po8eO2pIGCVwwO83oREJu8vRaOsWIWTzDO47yRrqyeELB2Krg8Aw3KDH6JPP+tEOhAwF
 IwLz68kuCZfgaZ0+qx7LprFJK2M8JyLAnpNJ7/UaNnvWANMqTXO4Cl1lVjv8BXhbexon
 HE9A==
X-Gm-Message-State: AOAM533beepAZAVtIzCWYNqeIGe9/1zTmQM7LDkihzKA6JOGDjUxhBAz
 AvaQhOWgip1Howv9YKdT+AK2SFZ9dSSeuuud9hq7i9gwwUPVDSkg
X-Google-Smtp-Source: ABdhPJxa/uB5IkTpq3CJZciDllwETjSjIJ0H+5RHqKiwYye8/RT9GtTbH25ouft8GU9JVIELgpyuK6Mk7kVBU2OyY70=
X-Received: by 2002:a05:6e02:1bec:: with SMTP id
 y12mr2728024ilv.74.1637297788255; 
 Thu, 18 Nov 2021 20:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-14-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-14-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 14:56:02 +1000
Message-ID: <CAKmqyKPuE4se33KAJSMfNBXoEfT9fwcX=x3PAH3dxSegVD19nw@mail.gmail.com>
Subject: Re: [PATCH v4 13/20] target/riscv: Fix RESERVED field length in VTYPE
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 19 Nov 2021 04:56:32 -0000

On Fri, Nov 12, 2021 at 2:06 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 52ce670cbe..b48c7c346c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -105,7 +105,7 @@ typedef struct CPURISCVState CPURISCVState;
>  FIELD(VTYPE, VLMUL, 0, 2)
>  FIELD(VTYPE, VSEW, 2, 3)
>  FIELD(VTYPE, VEDIV, 5, 2)
> -FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
> +FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 8)
>  FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
>
>  struct CPURISCVState {
> --
> 2.25.1
>
>

