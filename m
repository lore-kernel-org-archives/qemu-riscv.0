Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDYRR-0002Su-9d
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 14:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54738)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDYRO-0002RF-3I
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 14:56:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDYRN-0007ct-1d
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 14:56:49 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36287)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDYRM-0007Y3-Qh
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 14:56:48 -0400
Received: by mail-pl1-x641.google.com with SMTP id g2so4374511plo.3
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+0bPhTfpVLm4Se5rDwEqA55OKY69NbCPYl3fbHYKAck=;
 b=ilX5sU4dFpK/NhyhH1vn1BPelhTO+RwCmWtiQq2tl3gg7p90tPBze0byGPdeiBbQP3
 k1Ax5IwEv+lu14+hNncL8j1ql0pghV65ACV+p5inZwB26AEUmg9E5Fw03g9xWhDF7b/k
 k82e9D+RDVKByPyE1/6QfxS5qzMJVHYIUEn18cOECyAyhUAm3Wvg5EWGJ4FDYU8fYTRE
 S038QamyzRhEyXVunuq8/4F1sIDEFxJPAExuZCjQpdjTh7+0tR7+wGdcAFHzutK9eyyc
 r47R/2t+ns+VS5I04Gi21uh6v4Q6C0uYvfdn0fsHTlb+06SGzp3TztNbS5yibVhFT8P6
 0ljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+0bPhTfpVLm4Se5rDwEqA55OKY69NbCPYl3fbHYKAck=;
 b=PG2W16NuLRvURQTBq4zzzcnLUqrVcthguBSbCcuMqqyUoXIvCOa/nSYuOj5mf5p20/
 /ZyA5X9klG4jLwVj2AGtQ6gT4+syUNskvx5RTJacLHzj5acvvkrGNozuKpY15v6UwuR1
 FSIkm93YCrI2vKCc7u41+5k8GPuic0I0qGx2Xl96f44MyTSOPVw0TU55cNNNR5/YIaeJ
 R8TaP8w+WJ791+SfnjsEQtn5qRl2rg7oBZIzs2pxkVfAE8yENgkZiupSm3hGk9Rp5lbg
 quao+ePrDRq1wol16AxSgf5IciHMkN4ZcFc8Ci5tKf1JZshKKeTiwu19mG/CdGEuHioF
 sh6g==
X-Gm-Message-State: ANhLgQ3ML4FiMjXZw95PvHENWvTYSAandeTOT5jkYmVTbR+iRQ2Th1FK
 ETwbcqIGWOJdCanpGw+WZNxHHw==
X-Google-Smtp-Source: ADFU+vtXbpdOvdCuYM2qC6Qn8qlLsgLKKgnbyPRjsnLFfemCqboJpjTiLiK+B29tkCKGrkJOQQZpeg==
X-Received: by 2002:a17:90a:1784:: with SMTP id
 q4mr11450982pja.174.1584298607652; 
 Sun, 15 Mar 2020 11:56:47 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 4sm7787455pfn.156.2020.03.15.11.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 11:56:45 -0700 (PDT)
Subject: Re: [PATCH 02/14] configure: Avoid building TCG when not needed
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5d9da349-fd48-1d64-9f84-ae027c4c9d2d@linaro.org>
Date: Sun, 15 Mar 2020 11:56:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Sun, 15 Mar 2020 18:56:51 -0000

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Avoid building TCG when building only tools:
> 
>   ./configure --enable-tools --disable-system --disable-user
> 
> This saves us from running the soft-float tests enabled since
> commit 76170102508.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  configure | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


