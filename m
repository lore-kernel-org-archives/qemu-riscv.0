Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6GzB-0001ag-JP
	for mharc-qemu-riscv@gnu.org; Thu, 13 Aug 2020 13:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6GzA-0001aK-Mn
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2020 13:25:52 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6Gz9-0007vW-3G
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2020 13:25:52 -0400
Received: by mail-pg1-x541.google.com with SMTP id p37so3157822pgl.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2020 10:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wyg7l71x35BFZNv5hbIJgLUzGTHNVWCfUhp/BWXJAe8=;
 b=Wovw4ei+zMRi0L1m884v4e5R6xxJBUVOkj3x+RWwZUawTHt7s1EVpm+1ikqDPcb7S5
 I9WwWjrBShzpmBYfBDXcpFk7LUDKHGF1SfnmSRft2KLywMGmCI6FmTRMzXBaYtMJDr9q
 5gjet0UYO+hMxh9SgBJeovynOr2t7Y4WYXpI5dD5+MTgaa3Y1aFYcErDFHF85eqfYZvO
 TdoPZANoyVRxzEHldClFkZj+kxAwMZAqlHqf0nbKLTRFc9Y+T/k9pDNAnvAtSxfTwlvO
 6YI2DNaF6P3DuLudPqLj8FLPn9pmnufQolXkCVYWWYY4NF4foKyilRuaP0j1WcQY1KAA
 C9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wyg7l71x35BFZNv5hbIJgLUzGTHNVWCfUhp/BWXJAe8=;
 b=srDIZMdtnA4Szl6sbD3Q5siox+FFOSWpVezWK94cjUnJ2dxPpknzGBONRocW8t6y6U
 9p3MgC1q9ThGj2egcDuaw1SM/jz2+0Q4GxDN3BXOBxGK0ue6e1pfv0bSfTEZxyIngYPS
 zSr2DIGIlfM+E/8PGaGHAyyam0crwLxIXmgFL7A4Yo7GJBFRQyI//M7pw0gRtxMmiKXz
 CDz8uIt52y1zel2TOzQB5pCa/U8p7GYwc90SM9M4TjmqBtcfTziIHngOXt9tMbYoe/g0
 sLqThPDikEqcMADMMD3j4ucozTpRlXVFsb55UFp6AN3dB7bcB0DHKsNgD153x1Cyh+64
 1U8w==
X-Gm-Message-State: AOAM5322EzVD+h02vSiWqMhTX72S9kT3X9c7sA3OH0bMZAxxaYb9DyJs
 Z4Pm/ngtl0K9ngxELMgO9qGX5A==
X-Google-Smtp-Source: ABdhPJxVjzevL+X3jD7+S7azjbqd7EBpuF+q+bLRL7IZMa5dFRZrtVqIyskXNPamztilEWwWlaf2Fg==
X-Received: by 2002:aa7:9551:: with SMTP id w17mr5512160pfq.167.1597339549433; 
 Thu, 13 Aug 2020 10:25:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e13sm5783242pgs.13.2020.08.13.10.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 10:25:48 -0700 (PDT)
Subject: Re: [PATCH 3/3] softfloat: add fp16 and uint8/int8 interconvert
 functions
To: Chih-Min Chao <chihmin.chao@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <1596102747-20226-1-git-send-email-chihmin.chao@sifive.com>
 <1596102747-20226-4-git-send-email-chihmin.chao@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <979fce4d-75d6-2160-209c-46f4f9209a86@linaro.org>
Date: Thu, 13 Aug 2020 10:25:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596102747-20226-4-git-send-email-chihmin.chao@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 13 Aug 2020 17:25:52 -0000

On 7/30/20 2:52 AM, Chih-Min Chao wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Queued to softfloat-next.


r~

