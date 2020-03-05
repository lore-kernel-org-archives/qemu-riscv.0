Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9u9X-0000Hi-7N
	for mharc-qemu-riscv@gnu.org; Thu, 05 Mar 2020 12:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9u9V-0000FJ-9q
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 12:19:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9u9U-0001rk-4E
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 12:19:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60352
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9u9U-0001r9-0b
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 12:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583428755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m075kaYWXTizWWYNsFBPne4bGTz38tLlhSwqjD+7aps=;
 b=P5Lzt4tIRaSDkVWzaJZvrBn8eKTLjy5SOYJWUt0Wv5CcZyxv/aQ+v87Xu3PLA1Je/PgIyA
 VVy/DIwc0XLF7JkTvIjyEqueAolvxLwvt9moIB5qbZM+2vIHr3i2iCSEgFps4xZaVCpAcP
 sYnMuvQixPXEgkGNQQHbdBLKNuCfeH4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-pM8-f8x5P5m2Xp7QkB2NWA-1; Thu, 05 Mar 2020 12:19:13 -0500
X-MC-Unique: pM8-f8x5P5m2Xp7QkB2NWA-1
Received: by mail-wm1-f69.google.com with SMTP id m4so2337471wmi.5
 for <qemu-riscv@nongnu.org>; Thu, 05 Mar 2020 09:19:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZJEZ4zyLX2SfHkzLIN23t0UhNzHX3qv5gWBaJbpSFyE=;
 b=OeydmHhv1tsdW17rd5gpw8kUvqVvJSGT6tFc7M9x7vsYIrtiXBHIcVqgr8cQRofeOs
 koryqffEgmKs+3DbY2Vd7Secv4w2gV9dWUEDH0lZgU2+qHJLPUAxmCLq555SHu34QclY
 L76S0c2geRjXcPyMGSCbrtSAVpDp6SRBrGr0wNpshgMFynd7LJ4zbiUIuhyrK41oYL0W
 G7I43MRaGJcw6EIDeEACzPCXuBtZZ0ba/Y3jFT/aWw2SKbumfg5f4jUOOGnMNZRqHxHt
 vHuiMmhYwWWEjvVGTyQLGT67+o7AP35vdy2eS2IbY3xqnWMuzCpsbwzbzRFOX3cXXH0r
 0p0A==
X-Gm-Message-State: ANhLgQ1FrxDimrReCHNvFeY5aC53vn5DOCuKNn03kk+L39Q5yrj6zwFr
 TMG5vmh82sjKFRpy2aiP09HyKD/+pTk3O3ioTsAW2ua/hSp8Xe+o/4XwoIxnYPUsk4QkEcu9xga
 6on4RMU1e4LkYEA8=
X-Received: by 2002:a1c:f008:: with SMTP id a8mr10369214wmb.81.1583428752153; 
 Thu, 05 Mar 2020 09:19:12 -0800 (PST)
X-Google-Smtp-Source: ADFU+vv+6dGDDf4J6C6+rueASQZjrSO96wiK8XN5inah8ICyyuW+ycS8mvkvFi6LtpPKBupf1kK+Ew==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr10369195wmb.81.1583428751933; 
 Thu, 05 Mar 2020 09:19:11 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id j205sm9890331wma.42.2020.03.05.09.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 09:19:11 -0800 (PST)
Subject: Re: [PATCH] RISC-V: Add a missing "," in riscv_excp_names
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20200305164839.201311-1-palmerdabbelt@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cfc728aa-56a5-6a2d-a997-e1dfd871885c@redhat.com>
Date: Thu, 5 Mar 2020 18:19:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305164839.201311-1-palmerdabbelt@google.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Thu, 05 Mar 2020 17:19:18 -0000

On 3/5/20 5:48 PM, Palmer Dabbelt wrote:
> THis would almost certainly cause the exception names to be reported
> incorrectly.  Covarity found the issue (CID 1420223).  As per Peter's

"This", "Coverity" typos.

Fixes: ab67a1d07a4
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> suggestion, I've also added a comma at the end of the list to avoid the i=
ssue
> reappearing in the future.
>=20
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>   target/riscv/cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c47d10b739..c0b7023100 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -66,7 +66,7 @@ const char * const riscv_excp_names[] =3D {
>       "exec_page_fault",
>       "load_page_fault",
>       "reserved",
> -    "store_page_fault"
> +    "store_page_fault",
>       "reserved",
>       "reserved",
>       "reserved",
> @@ -74,7 +74,7 @@ const char * const riscv_excp_names[] =3D {
>       "guest_exec_page_fault",
>       "guest_load_page_fault",
>       "reserved",
> -    "guest_store_page_fault"
> +    "guest_store_page_fault",
>   };
>  =20
>   const char * const riscv_intr_names[] =3D {
>=20


