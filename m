Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzKRw-0007DF-SV
	for mharc-qemu-riscv@gnu.org; Sun, 18 Aug 2019 08:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45789)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzKRq-0007AC-RD
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2019 08:38:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzKRp-0007BO-Jb
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2019 08:38:14 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38502)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzKRm-00078c-9w
 for qemu-riscv@nongnu.org; Sun, 18 Aug 2019 08:38:11 -0400
Received: by mail-wr1-x443.google.com with SMTP id g17so5898099wrr.5
 for <qemu-riscv@nongnu.org>; Sun, 18 Aug 2019 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q2CECf3Z0VZS2vsykoHMilxYJWnJFnixOycIv/0VdAc=;
 b=vH3nKXklQ3D6J2/DUV/Muhm5EQqjnOi1dOFDnoYkoWbFdHGdCTt0Q8H/PEx3US8HVr
 BvUvT45unuUHziXG9CABuehFsnGiy92O9yPs6EM1DOjtOQOUOf5aNmusmYAtenEpKhZU
 Pu6WIhMrgQs6oTjcv5/b9mcugffLmrQy+Ga3LvHGe4Cbic6u7Zp2AlmUwB1zher+kYK6
 3yBCSezj6lVnUja0g2Vxd3RILIf1CcZ6VnwhbaSkueQsZrX7Limpesb3ZKhlOXNae2KW
 7sCJeCoUVb6HYQGT38JuljsiR4FUcloY4PuupNMx8KAHk526GfDKtMT4X6DaoSdbTrHc
 yG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q2CECf3Z0VZS2vsykoHMilxYJWnJFnixOycIv/0VdAc=;
 b=NZ03UWQvzjRgr3h7IWmHlfq9q+uQw08SATEAYVzGaQE1HmIGdtX4khxL1xiJ7KakQ9
 4XPfzZxEYi+9H2fSGy93RNqtFqd1NGzW72kXOO0QIj+tplQK6EGWuWLKuMMGl2HiTUH6
 NAy8hLWkNXQ0OXycLjJdmgVHW0Vcat4NbYdkVlflVHDU8Lp2FsTVTQV+xaxaDK/E2eln
 hT3jQee9c94tl4jI4kgTAaTz/oodwQOjkEGYlYjos3/gCJV9YK6Vd10F/5EurIznWZDz
 JewR3DTr6xuE9e3mScIZON9mK99O2ZVrwm7xidqxGpDBBeAvKCROkxLtQESe++H3lN1r
 6qwQ==
X-Gm-Message-State: APjAAAU8kbnYnVGyHk8fPwmrmtYaHxsvg+yJ3w4vsfwv1jlZiDJDsa0R
 Mp2pIR6Tq0mp3hwX6NEjV2F2RA==
X-Google-Smtp-Source: APXvYqy8+V4wmFtUbhYj8pIGMMLehGXowLZiVAQJJkcV7DuCTxUQaFYSL+0IQlwYdqSdVJrbjHii/Q==
X-Received: by 2002:adf:f710:: with SMTP id r16mr22248357wrp.81.1566131885195; 
 Sun, 18 Aug 2019 05:38:05 -0700 (PDT)
Received: from [172.16.53.135] ([82.3.55.76])
 by smtp.gmail.com with ESMTPSA id r190sm12495818wmf.0.2019.08.18.05.37.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 05:38:04 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 lersek@redhat.com, jasowang@redhat.com, jiri@resnulli.us,
 ehabkost@redhat.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, andrew@aj.id.au,
 claudio.fontana@suse.com, crwulff@gmail.com, laurent@vivier.eu,
 sundeep.lkml@gmail.com, michael@walle.cc, qemu-ppc@nongnu.org,
 kbastian@mail.uni-paderborn.de, imammedo@redhat.com, fam@euphon.net,
 peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, atar4qemu@gmail.com, minyard@acm.org, sw@weilnetz.de,
 yuval.shaia@oracle.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com, qemu-riscv@nongnu.org,
 i.mitsyanko@gmail.com, cohuck@redhat.com, philmd@redhat.com,
 amarkovic@wavecomp.com, peter.chubb@nicta.com.au, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 robh@kernel.org, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, jslaby@suse.cz,
 marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com,
 david@gibson.dropbear.id.au, xiaoguangrong.eric@gmail.com,
 huth@tuxfamily.org, jcd@tribudubois.net, pbonzini@redhat.com,
 stefanb@linux.ibm.com
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941103483.3364@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <078b4e19-2b1e-bc21-f419-1064e45e5173@linaro.org>
Date: Sun, 18 Aug 2019 13:37:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565941103483.3364@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 37/42] cputlb: Replace size
 and endian operands for MemOp
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
X-List-Received-Date: Sun, 18 Aug 2019 12:38:17 -0000

On 8/16/19 8:38 AM, tony.nguyen@bt.com wrote:
>  static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
>                                TCGMemOpIdx oi, uintptr_t retaddr)
>  {
> -    return load_helper(env, addr, oi, retaddr, 1, false, false,
> -                       full_ldub_mmu);
> +    return load_helper(env, addr, oi, retaddr, MO_8, false, full_ldub_mmu);
...
>  void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
>                          TCGMemOpIdx oi, uintptr_t retaddr)
>  {
> -    store_helper(env, addr, val, oi, retaddr, 1, false);
> +    store_helper(env, addr, val, oi, retaddr, MO_8);
>  }

MO_UB.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

