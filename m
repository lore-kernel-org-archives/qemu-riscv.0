Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDID4-0002Lo-0o
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 21:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35634)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDID2-0002Ld-GH
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 21:36:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDID1-0006Lc-Cm
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 21:36:56 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40399)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDID1-0006IV-7m
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 21:36:55 -0400
Received: by mail-pl1-x644.google.com with SMTP id h11so6150371plk.7
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 18:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MkPh+klBPXxqZj98aRVuJbutaODh1jtYz1eovAeUds8=;
 b=mQVxIbCLIm5GR4FENAbW1w0EKfFeWJGOciTEPfdo+D2hFgNIckQIhrt/S/gBJzaDOb
 rN2qpJBCZg+xKO1kB912jDUahkD3czWw5xD7cBlxEXaMxhZKczeBkJLFBsTgcsCq9waG
 a4QeLwkMMpcWoebTFBpNxD8vI9Pr9AaayPCUi/HYwKCk5L0hIleScQz/Z0ah/8vCsbI/
 I9PuPmI4Ood9/bmSCfTbfS8RLTUZbgurFYhIDjuG16gKNBXDN7KXIKhW23twjY+HfQCB
 wNSvkXEBJKrguLvatPjCmu36+df5e7qzSoP/+WiYux8seAnhTRBI7J81gjO8S8j0VBUA
 bBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MkPh+klBPXxqZj98aRVuJbutaODh1jtYz1eovAeUds8=;
 b=aKI2quA8LsCXoFkOJsbpqrWxCvcF9a8vNIxVO5Dgyp5KvfUZBC5WHQFz5qy8jbxFQC
 ocQXRkGl5bjouQ3GwUOGg1FNW+kJP151lbAMiyYHSsm5ST1ZCtxdEvT4oZOwcJadUGNe
 fy5usCQavbdAJGgQ4dXSpo9xci8YiNg0mG5uRPBTQwhUXrJqpELkVehpfUsm91/V8B7J
 fDlg3y5WswhWWJ1CoKbAGzDtwqdjKuBAnjCtSqfqXFTLmBCpGeYRwDBUSzcPD8+iDzbR
 90lDdmfQRKOlFzJs7nXH+SXB2MGspK6aO4j4abFd9RfvPomzV9OeZ5hBHpparNjEpvNS
 9aag==
X-Gm-Message-State: ANhLgQ0U2858okO/auPhNRsKVRM6Z88qBVqBmzqRGnHBxD2c0bwkEjmX
 eFy/fCzm1nUgXXMeTqzYfl4mz8EDZ84=
X-Google-Smtp-Source: ADFU+vuzgW1+1LHRTEe3CcbvmTeTa8lr1GozmfsCfpmNS3wcO2FWIZahChLoJp37jfA+apOUNzIr6Q==
X-Received: by 2002:a17:90b:4c91:: with SMTP id
 my17mr3328953pjb.140.1584236213697; 
 Sat, 14 Mar 2020 18:36:53 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 15sm4593122pfu.186.2020.03.14.18.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 18:36:53 -0700 (PDT)
Subject: Re: [PATCH v5 50/60] target/riscv: vmfirst find-first-set mask bit
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-51-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e514fa28-dee0-2c25-8ee2-9aa8b5d2ea77@linaro.org>
Date: Sat, 14 Mar 2020 18:36:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-51-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Sun, 15 Mar 2020 01:36:57 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +/* vmfirst find-first-set mask bit*/
> +target_ulong HELPER(vmfirst_m)(void *v0, void *vs2, CPURISCVState *env,
> +        uint32_t desc)
> +{
> +    uint32_t mlen = vext_mlen(desc);
> +    uint32_t vm = vext_vm(desc);
> +    uint32_t vl = env->vl;
> +    int i;
> +
> +    for (i = 0; i < vl; i++) {
> +        if (vm || vext_elem_mask(v0, mlen, i)) {
> +            if (vext_elem_mask(vs2, mlen, i)) {
> +               return i;
> +            }
> +        }
> +    }
> +    return -1LL;
> +}

This is ok as-is, so
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

But you can do better.  With the mask, as discussed, the inner loop looks like

    j = mask;
    j &= ((uint64_t *)vs2)[i];
    j &= ((uint64_t *)v0)[i];
    if (j) {
        k = ctz64(j) + i * 64;
        return k >> log2_mlen;
    }


r~

