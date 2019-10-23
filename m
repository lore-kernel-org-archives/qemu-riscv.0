Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNIuq-0001vf-QY
	for mharc-qemu-riscv@gnu.org; Wed, 23 Oct 2019 11:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iNIud-0001oF-Gt
 for qemu-riscv@nongnu.org; Wed, 23 Oct 2019 11:51:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iNIub-0002By-RE
 for qemu-riscv@nongnu.org; Wed, 23 Oct 2019 11:51:03 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37706)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iNIub-0002BY-IU
 for qemu-riscv@nongnu.org; Wed, 23 Oct 2019 11:51:01 -0400
Received: by mail-pg1-x543.google.com with SMTP id p1so12395838pgi.4
 for <qemu-riscv@nongnu.org>; Wed, 23 Oct 2019 08:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lGu68nCovEPsrHRd7JaveUjJGF93eRXSwxmkZjlbdJw=;
 b=eY/S4Yd3LHO7/oBnR0ioqvL15/MAblYJdjBoQQfRfMp9MMWfLpMmIoXY26MNTgCA8N
 gFpFxlw3lyK4KWVaWZcefIHmmmVA+T0LKduUO9yQQIArBZc1gCw2pjaKvfOSEj7Vk7QG
 yd439nMD1QfcnuFIgcGHUqfjVnJ5tnuKzhSvEteyKRdUfL66y9/pdsWkwakusWBPRwSr
 a3fgeuBRVojwSVlRysyCxvKOijnOQs+NS30cyKAVU1IXbLBlR5YeZ/xrVKjlwsHJ5vGg
 mtSMvwHl8Hy7Ot1Wk9rksXQr40yR6NQUXjvdiYWNRLx/YiOzPfT+vTDQ8RFcPpWPTUEO
 kU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lGu68nCovEPsrHRd7JaveUjJGF93eRXSwxmkZjlbdJw=;
 b=U9QlvFElLNlRkPwPcoG/I7CnU+vMsNc//teqoPqP+YfxgGzKwY9oRm+3DyTGrUZ2l1
 5H5HDF/DAd/xYhYUHI2AT1THBt98eFtQP1FMbgl6aDpWMp2KmtTzH7ZizjRytI3RZ61y
 oYG12zd2XoZkyNrf4JKmID2mOqKOg4vlIXYFN5bznh/q301ssHy42jXmOnksbHcE3qy+
 OP7WXXpOb7a8kJHvOpZJepvTZet+NR0uWy4FQugDMRjGn/8nXTYmXHTESE7B0pa0bJeb
 GBKb1q7NSi7SBwUnxU5E4tGPknjb9F3Ec5x7TtBp6KI+Ez3j78f/v5wX0Jrfnsx/d8RT
 Ni4w==
X-Gm-Message-State: APjAAAVNi4BtWiWZO/Q5QPYZSJDYYYmCDeYwGqU+PcOoK/su+W1jyCPK
 DXf558/9hIxUVUsRa7BOXA1G9Q==
X-Google-Smtp-Source: APXvYqyT6x8Swfsd/vljMYdifmUQe4kOcuKxi4C660WcA6a1PgzYQ0K4zq7zAhq0m2x8KyZECeJobQ==
X-Received: by 2002:a62:31c2:: with SMTP id
 x185mr11788403pfx.112.1571845860194; 
 Wed, 23 Oct 2019 08:51:00 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 64sm23863659pfx.31.2019.10.23.08.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:50:59 -0700 (PDT)
Date: Wed, 23 Oct 2019 08:50:59 -0700 (PDT)
X-Google-Original-Date: Wed, 23 Oct 2019 08:50:19 PDT (-0700)
Subject: Re: [PATCH] target/riscv: PMP violation due to wrong size parameter
In-Reply-To: <20191022212129.8452-1-dayeol@berkeley.edu>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 dayeol@berkeley.edu, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 richard.henderson@linaro.org, Alistair Francis <Alistair.Francis@wdc.com>,
 diodesign@tuta.io
From: Palmer Dabbelt <palmer@sifive.com>
To: dayeol@berkeley.edu
Message-ID: <mhng-bdf2777a-b43b-4192-aa4f-ba07fa146a62@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-List-Received-Date: Wed, 23 Oct 2019 15:51:13 -0000

On Tue, 22 Oct 2019 14:21:29 PDT (-0700), dayeol@berkeley.edu wrote:
> riscv_cpu_tlb_fill() uses the `size` parameter to check PMP violation
> using pmp_hart_has_privs().
> However, if the size is unknown (=0), the ending address will be
> `addr - 1` as it is `addr + size - 1` in `pmp_hart_has_privs()`.
> This always causes a false PMP violation on the starting address of the
> range, as `addr - 1` is not in the range.
>
> In order to fix, we just assume that all bytes from addr to the end of
> the page will be accessed if the size is unknown.
>
> Signed-off-by: Dayeol Lee <dayeol@berkeley.edu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/pmp.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 958c7502a0..7a9fd415ba 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -232,6 +232,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>  {
>      int i = 0;
>      int ret = -1;
> +    int pmp_size = 0;
>      target_ulong s = 0;
>      target_ulong e = 0;
>      pmp_priv_t allowed_privs = 0;
> @@ -241,11 +242,21 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>          return true;
>      }
>
> +    /*
> +     * if size is unknown (0), assume that all bytes
> +     * from addr to the end of the page will be accessed.
> +     */
> +    if (size == 0) {
> +        pmp_size = -(addr | TARGET_PAGE_MASK);
> +    } else {
> +        pmp_size = size;
> +    }
> +
>      /* 1.10 draft priv spec states there is an implicit order
>           from low to high */
>      for (i = 0; i < MAX_RISCV_PMPS; i++) {
>          s = pmp_is_in_range(env, i, addr);
> -        e = pmp_is_in_range(env, i, addr + size - 1);
> +        e = pmp_is_in_range(env, i, addr + pmp_size - 1);
>
>          /* partially inside */
>          if ((s + e) == 1) {

Thanks.  I've queued this up for my next pull request.

