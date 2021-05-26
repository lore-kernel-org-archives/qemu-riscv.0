Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llxd9-0004Ny-S9
	for mharc-qemu-riscv@gnu.org; Wed, 26 May 2021 13:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llxd4-0004GT-QC
 for qemu-riscv@nongnu.org; Wed, 26 May 2021 13:47:38 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llxd1-0000al-3n
 for qemu-riscv@nongnu.org; Wed, 26 May 2021 13:47:38 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 h20-20020a17090aa894b029015db8f3969eso783646pjq.3
 for <qemu-riscv@nongnu.org>; Wed, 26 May 2021 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rRju/jjBGwrN1xvcOyDup2sVG0roEKR7mdyoEfLmHKI=;
 b=dGmD93+cb3/ZbvKlxKnzI/NwvWQe4TAKedNWgSS/sBrFCXCad5sFoObCjqVNGlRy5P
 C5W/0gC+dgaTfuHwIXELUN+BBIiqAwAExB7m9eZELNqtv5MNFEVOKwRHBs1vo+q9iGgQ
 z8pi03s8LAOES+QuznASx75mHgc+a1sG5YFSLFXbfhYsdFXKlTTD/5HJDs1pnOKpB9X2
 Q9gBQnjyZxXDozdrSlLQAkhrAijji3dbTYxvxfpmJbLe5QKthhTqJNTOAmpjEYQjMGiX
 sNk2KHI/F7HxWxRaWSpP8ePr6RFRhJTlenmw+ND8GDhcO79QyfcVVAGUiBVee3vVYi/j
 COpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rRju/jjBGwrN1xvcOyDup2sVG0roEKR7mdyoEfLmHKI=;
 b=JJk39OxxTyRxrzMswzwwnx+0dGLPrz1VcorkLJeLPd8i0K7J4LbS84OvUn2SxFlf2H
 yCR/+a7/9LZvCSgMVuY0o57d2dXkGgXc4Y4cUU9uMjc4r22/Qkh1oZADNmaH5C3Wa+Yn
 WS2ypTsRkpzio/g2JDAa6fRtLe+uCmCxSy/uNbOBXk/TbZSueAcBRqNjp8Cy9HshRlzo
 EptrMYWQKCQZ677A1/2QKpMOpdPQh/NpmMpiOCMPsPqLFXYXlabWvHXZrjMu4Iu2arpb
 7i+Gts2xx2ia+30aUCf06JMFykLkGbiQ7P3OfKHxyp+rC/KCvKpzd321/7xu24w+ODZw
 EFJA==
X-Gm-Message-State: AOAM532GL8ptsHuphSU7di+4g7Y2p0Vay+BbARDpfcy1q18ApI9lwlyo
 08o/hrvCdj4iS4vZ0mDCLePz/w==
X-Google-Smtp-Source: ABdhPJyJt6RXvgXGR/QOyWAie6rIqK4qmnA7TUr2xIJAabbtjG22pMh8pBQtHCOfbVLS93H5uyfA9g==
X-Received: by 2002:a17:902:e850:b029:f0:baa0:19ea with SMTP id
 t16-20020a170902e850b02900f0baa019eamr37145287plg.47.1622051252600; 
 Wed, 26 May 2021 10:47:32 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id k9sm13517pgq.27.2021.05.26.10.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 10:47:32 -0700 (PDT)
Subject: Re: [PATCH v7 02/23] cpu: Restrict target cpu_do_transaction_failed()
 handlers to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210517105140.1062037-1-f4bug@amsat.org>
 <20210517105140.1062037-3-f4bug@amsat.org>
 <ae262a9c-1ffa-b680-4aa6-d7256fa6947a@linaro.org>
 <5a1389f6-ced6-3b09-ba9b-749e2db2de4b@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c35d706-be36-1715-2fba-b43bd230d1c5@linaro.org>
Date: Wed, 26 May 2021 10:47:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5a1389f6-ced6-3b09-ba9b-749e2db2de4b@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 26 May 2021 17:47:39 -0000

On 5/26/21 10:22 AM, Philippe Mathieu-Daudé wrote:
>> What do the extra ifdefs buy us? Surely the fact that the symbol is not
>> present in the user-only, and would produce link errors if used, is
>> sufficient?
> 
> Last month on another series you told me we should declare prototypes
> that can't be used :) However I agree we want *less* #ifdef'ry, not
> more.

Should or shouldn't?

Anyway, I don't think any of these declarations belong in cpu.h.  There's no 
reason for any external user to reference them, as they ought to be using the 
hw/core/ cpu_* functions.

In an ideal world, we'd move them into some target/foo/sysemu/internal.h or 
something, which would involve no ifdefs and still give you the isolation.

But for the bulk of the targets, I think it's just easier to leave them alone.


r~

