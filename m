Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jvKsj-0002DJ-IQ
	for mharc-qemu-riscv@gnu.org; Tue, 14 Jul 2020 09:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvKsh-0002CZ-Q1
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2020 09:21:59 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jvKsg-00070F-8u
 for qemu-riscv@nongnu.org; Tue, 14 Jul 2020 09:21:59 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e8so7588883pgc.5
 for <qemu-riscv@nongnu.org>; Tue, 14 Jul 2020 06:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HQ/jqj4l+Y6oRDJ+E+cXtneIopr0U6a/vMKRts+AgyQ=;
 b=Yuvf0SmkiTBUm8EWqBEX1goVpgXMF1dP17uDlneO3H4rqLmEvrZkH7Tmlt2JbZR21a
 7vaJs3p98iPgF06RBoZ4rBC8t3S+jxe/nPPqiFabtTPxFPdKYP6awzlz/Yoo6zAdLRud
 cJ03SJ6uDR+3IwHsmVL9jZHR0MSu/w9Xkcu8id/++mSQDj5/ifXdLursSPCPfldG+NjO
 gOvZ9FNAI/YS+wlE6kI/WtRVS1W9pBOK0WVT/clZELTnbLNP/dsxFFMzqmK39WckyiqL
 228IwbJBZrvTyq80WtUqHiF0jn5tiZcESrV0pyQKHLhoi930TofNLL6H2JPQ/g1gQqO9
 XNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HQ/jqj4l+Y6oRDJ+E+cXtneIopr0U6a/vMKRts+AgyQ=;
 b=furyoGnfyif3elSjUEn44SBUUa47BIrj2QhPdnciwvz7HhADcFGhcfQnQIxX7hnFrp
 Mmhy5W8Omb14Nb4gHGEQ0DHPFseQRxtC8tPdv8vXgR7I6Fbgg6kqNUyPlji7A8K61ok8
 3munOXdfDTY/VLnNLGlmLtrhYo3X9e7EldHDuZO03ax7S/RJU9LTH5fWnMDBD8tBPlpb
 53dl0zmDuIylY4OP4h5zpwE4Nt9q1qP13mp58u4Rna9iASof0AATd5IzZg35N6H/0uUl
 S9oqho9zxWiSJNRp01vogh6O2x/goR0D++Yxpo71pHN6lG1haB/WqNddU6KhGxAnm1zp
 Mufg==
X-Gm-Message-State: AOAM530BUcaRSFJZVSBoj4UFjmb+33JcOuzkBXY/WCfMX6OM9FKOa2gW
 n79B+o61HBQbThMplydxZ7kHQg==
X-Google-Smtp-Source: ABdhPJzb0qXTVg6C3sgzI7U7BhyJIMGcTiEiyUk5fQiQMCEaXZH/ZRvk0zHKkrfc7L+USB173Z6qdQ==
X-Received: by 2002:a63:e60b:: with SMTP id g11mr3523842pgh.188.1594732916207; 
 Tue, 14 Jul 2020 06:21:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id e191sm17319155pfh.42.2020.07.14.06.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 06:21:55 -0700 (PDT)
Subject: Re: [RFC 05/65] target/riscv: remove vsll.vi, vsrl.vi, vsra.vi insns
 from using gvec
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-6-frank.chang@sifive.com>
 <452e8bc7-4622-77c2-ec81-9aa6f25705fc@linaro.org>
 <CAE_xrPjWr2KShiwaCZi1DXueFnRAz41D3j9_k2vBL2j7-d9WOQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0ccc7311-02f4-821f-6272-73ab600a8cda@linaro.org>
Date: Tue, 14 Jul 2020 06:21:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPjWr2KShiwaCZi1DXueFnRAz41D3j9_k2vBL2j7-d9WOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Jul 2020 13:22:00 -0000

On 7/13/20 7:59 PM, Frank Chang wrote:
> The latest spec specified:
> 
> Only the low *lg2(SEW) bits* are read to obtain the shift amount from a
> *register value*.
> The *immediate* is treated as an *unsigned shift amount*, with a *maximum shift
> amount of 31*.

Which, I hope you will agree is underspecified, and should be reported as a bug
in the manual.

> Looks like the shift amount in the immediate value is not relevant with SEW
> setting.

How can it not be?  It is when the value comes from a register...

> If so, is it better to just use do_opivi_gvec() and implement the logic by our
> own rather than using gvec IR?

No, it is not.  What is the logic you would apply on your own?  There should be
a right answer.

If the answer is that out-of-range shift produces zero, which some
architectures use, then you can look at the immediate value, see that you must
supply zero, and then fill the vector with zeros from translate.  You need not
call a helper to perform N shifts when you know the result a-priori.

If the answer is that shift values are truncated, which riscv uses *everywhere
else*, then you should truncate the immediate value during translate.


r~

