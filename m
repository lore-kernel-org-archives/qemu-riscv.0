Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwEtE-0001tg-KC
	for mharc-qemu-riscv@gnu.org; Fri, 09 Aug 2019 20:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37503)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hwEtB-0001s1-Ua
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 20:05:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hwEtB-0003oM-0C
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 20:05:41 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45086)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hwEtA-0003o5-PW
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2019 20:05:40 -0400
Received: by mail-pg1-x543.google.com with SMTP id o13so46588476pgp.12
 for <qemu-riscv@nongnu.org>; Fri, 09 Aug 2019 17:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KuOmabyGayKaxdTh8IaiojNUoRqfmhsr1PHH3EYV+d4=;
 b=r5q7+dYYLIX0Vdl7lbg1ZZNbRhMdSgWp/GmIN/nGQ8Qpper3WuLjuOc1xAExaynogb
 jHvSt/0clHXfNF/gIbcTUzfM2CU+UM+A+HOnc29TjA/zt0BtWWecax/gCvnvCsEeietZ
 9Doc26lyU1INTiGO1vR63IUTudB0KqjfwpAVmdIZXcxGfuILuKPxy4fgk0jfaJc2QGTe
 j4Sgso+E20rwBthwR+Ezv7DuAI60aN6IrGP+EoTYlsoyFQrng37KvuN98msJAszdB3jd
 fZbBDIXbpdbMvsL1OdFrGw1aNGoAsVhBZ5sCY7LX31mY/L5iYeMBN6J+QnACDXnU1pHW
 jMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KuOmabyGayKaxdTh8IaiojNUoRqfmhsr1PHH3EYV+d4=;
 b=Xr1ZTF9xX0SZ5/PZvuj4D8gNAYcljEfwA8x6wHEtee29UJzPnq7F4+Mqd3Wx8fL7Gc
 FRKBrKIA6BM6PU0IApBsdy+En9WlkVkidaqwl5KoTEKa3nsVezGQ4oFTTdr/1JoQKXJp
 9d2KkvfzN34Phvl+uU7WV4RXyECYugyDa4CPrsNS1PeGHTdKxFT7MOlyxPzZMx/Xh3yX
 F3ZXrKv8+PFj+fbOj72W/4x+dzsBJDGqxAe2rXW8WZfS5utrHVpusXozHmsAMG+4qG/t
 CXdLNwj77d76FIbZzzatQ121Z438xg0yRUguv6w6nosdt+AlyubDV7x/8VjN1QwdhuUy
 j4Sw==
X-Gm-Message-State: APjAAAU0KmfPu9kdSNRawD+HcWVeU1NeRN3CxeEyFoksAEUEOVdncvSy
 9xKTf8BI0amRSiw3tGZrMIMhYA==
X-Google-Smtp-Source: APXvYqxc3l/K/l8KKQ7p7Rd3uqPpaor2OSBV0MARctmVeN5tTArpuv75M+sAdXAgOVTSIVawcfUDVQ==
X-Received: by 2002:a17:90a:9f46:: with SMTP id
 q6mr6749833pjv.110.1565395539309; 
 Fri, 09 Aug 2019 17:05:39 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id y11sm107505702pfb.119.2019.08.09.17.05.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 17:05:38 -0700 (PDT)
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, philmd@redhat.com
References: <mhng-b7c59cf4-b345-4805-897a-bf6a1c2c7c99@palmer-si-x1e>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b45b234d-d367-941e-cb61-1d2dc76725e1@linaro.org>
Date: Fri, 9 Aug 2019 17:05:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <mhng-b7c59cf4-b345-4805-897a-bf6a1c2c7c99@palmer-si-x1e>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 3/3] target/riscv: Remove
 redundant declaration pragmas
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
X-List-Received-Date: Sat, 10 Aug 2019 00:05:42 -0000

On 8/9/19 10:43 AM, Palmer Dabbelt wrote:
> Acked-by: Palmer Dabbelt <palmer@sifive.com>
> 
> I assume you're taking this along with the rest though your tree.

Yes, that was my plan.


r~

