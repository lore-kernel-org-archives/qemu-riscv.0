Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jUFI2-0008Rs-Tw
	for mharc-qemu-riscv@gnu.org; Thu, 30 Apr 2020 15:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jUFHW-0007Od-QD
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 15:56:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jUFGI-00076O-TS
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 15:55:38 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:35595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jUFGI-0006y1-Dc; Thu, 30 Apr 2020 15:54:22 -0400
Received: by mail-il1-x141.google.com with SMTP id b18so2577107ilf.2;
 Thu, 30 Apr 2020 12:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0rW6ZHBwhJGM7oUVbxpCTn1jvQK5R6MzduYksnD23GY=;
 b=kbIwaOX+Vs3yIDfGlj3k9ZPqbWUIQRykyaVd2jxq0jG/c0pvnZmOsVId+uB35Ekr40
 UrkEJe4kfxucKV1967A2nQZxlikEGNS1GNet1bHP2hLH8/nr6nrUG2VUnDTsF31qAtgi
 sVH7sJ80MfaekBcj7kYsKSnZHysztDrhefj2OvW+jdd/B8HCrmfY7HzNzF8fKQS2Hg10
 ryBtMM2iPypVYWBkerccG9g9Ex21LFcMicMZzHhRwc8nsdfnugnCLEEzw2roW2ABw+W+
 GfQIA7W/i5s+ZJtDx7E1XXrXy1aWuc6MjyClJ1ZcZ1hF7rvLlC1duUwoB2YVVsyrqrQt
 wKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0rW6ZHBwhJGM7oUVbxpCTn1jvQK5R6MzduYksnD23GY=;
 b=USAgGozRcDtPZLpfpu4kUX9JzCgYmh2bCKHsAGD2vaec0YhDAg1eFnlsJq0OA7q2vj
 mvPcIHZSNH9VJQ1xy8aGhVw98nFxufl+4StVIlHfdrmaBSmgtIFbVq1qHK+/vLtbWpP9
 jKm6SInX0S3PK6fhXn8BQhTV+T1b0qBadZLzR5Sosx1OhPtj8WbddEcpLUkwey5j/tPO
 rC87Syo0pduhNiSlOvbOucgSJzd4r5TVmBKWgYFmnJ9RzLA7PYY3EWV+QNDWZNMJuAn7
 4EhCZWwvzJgAOqQKkue21pV9NzpAB55/SlxedmiNSKWmgXOjxDLcDhz2GgL4/vH/fFdi
 PLmg==
X-Gm-Message-State: AGi0PuYv3UwQpMb6XQ3INkZPomlv8S2y9Rx+p4Vb22RlNL8WJRYCIEqT
 KoiRoJXtLozTURxtGYY9luP9qOEjOg2IlUphdGc=
X-Google-Smtp-Source: APiQypIvQVnoK5n1ojlg8TYH9fo7k6hkVT3pMgebeacyWC8YjkadFdjsO+Yfj1HlumTbgG6aQykAqZiKU6y2Gl/ZlAc=
X-Received: by 2002:a92:9a5c:: with SMTP id t89mr3809778ili.267.1588276459326; 
 Thu, 30 Apr 2020 12:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAC41xo2LfTQZnor5haAgBg=h34qv50xf8Bs1bgSeGESfr-E2ng@mail.gmail.com>
In-Reply-To: <CAC41xo2LfTQZnor5haAgBg=h34qv50xf8Bs1bgSeGESfr-E2ng@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 30 Apr 2020 12:45:45 -0700
Message-ID: <CAKmqyKNMiD6VJ1D-ty-q_HMyiZ7oj7F0XraKTaYy78-xjhAN4A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix check of guest pa top bits
To: Jose Martins <josemartins90@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::141
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
X-List-Received-Date: Thu, 30 Apr 2020 19:56:09 -0000

On Fri, Apr 24, 2020 at 8:10 AM Jose Martins <josemartins90@gmail.com> wrote:
>
> The spec states that on sv39x4 guest physical  "address bits 63:41
> must all be zeros, or else a guest-page-fault exception occurs.".
> However, the check performed for these top bits of the virtual address
> on the second stage is the same as the one performed for virtual
> addresses on the first stage except with the 2-bit extension,
> effectively creating the same kind of "hole" in the guest's physical
> address space. I believe the following patch fixes this issue:
>
> Signed-off-by: Jose Martins <josemartins90@gmail.com>

Thanks for the patch.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

> ---
>  target/riscv/cpu_helper.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index d3ba9efb02..da879f5656 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -421,15 +421,21 @@ static int get_physical_address(CPURISCVState
> *env, hwaddr *physical,

There seems to be a strange wrapping here, that corrupts the patch.
For future patches can you please check your git send-email setup?

Applied to the RISC-V tree with the above line fixed up.

Alistair

>      int va_bits = PGSHIFT + levels * ptidxbits + widened;
>      target_ulong mask, masked_msbs;
>
> -    if (TARGET_LONG_BITS > (va_bits - 1)) {
> -        mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> +    if(!first_stage){
> +        if ((addr >> va_bits) != 0) {
> +            return TRANSLATE_FAIL;
> +        }
>      } else {
> -        mask = 0;
> -    }
> -    masked_msbs = (addr >> (va_bits - 1)) & mask;
> +        if (TARGET_LONG_BITS > (va_bits - 1)) {
> +            mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> +        } else {
> +            mask = 0;
> +        }
> +        masked_msbs = (addr >> (va_bits - 1)) & mask;
>
> -    if (masked_msbs != 0 && masked_msbs != mask) {
> -        return TRANSLATE_FAIL;
> +        if (masked_msbs != 0 && masked_msbs != mask) {
> +            return TRANSLATE_FAIL;
> +        }
>      }
>
>      int ptshift = (levels - 1) * ptidxbits;
> --
> 2.17.1
>
> Jose
>

