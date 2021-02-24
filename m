Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lEi5Q-0004cJ-Ql
	for mharc-qemu-riscv@gnu.org; Tue, 23 Feb 2021 19:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEi5I-0004aL-8c
 for qemu-riscv@nongnu.org; Tue, 23 Feb 2021 19:31:21 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEi5F-000454-2H
 for qemu-riscv@nongnu.org; Tue, 23 Feb 2021 19:31:18 -0500
Received: by mail-pf1-x435.google.com with SMTP id x129so126677pfx.7
 for <qemu-riscv@nongnu.org>; Tue, 23 Feb 2021 16:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e7ur4r/F4UC6pxcmPUe8rLeEdwOc9TbFAvtUqu1Clzs=;
 b=h8fXCrxj2RFDkj4EbCJHaifob32E2FM3U7XDV+9WP5duYMijZGJ63P7uok8a9sEE/H
 k1wDhhiAepJDPDXSWlz80aRUtRqwvO41e8CCCXxpnhAtjl+jwepggQVl8OaBPKrBni67
 I42EgfvauFdI61LlzcJkOPypbArjRl27swhxNXAn4UcvhPmBsaSoScGAONXhQma4941C
 6EGIzhKgK2Zqt/5q+aVrYKPW/xtZh2A27cnqXzrMpCoddFDM3P1VZfwJOIBD3V8XS0Qe
 0Gsj/q1hxBcxg4SJ19KCeUVUAlkJAj6gixOIw7oRI8bKjnPsZYJFZDDw9cHQd98kzMCx
 A/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e7ur4r/F4UC6pxcmPUe8rLeEdwOc9TbFAvtUqu1Clzs=;
 b=Klp+X80znYk2LnPwe8Q1rAX6dtz+GGWZjSUR8571JF8R54HM2IK51PEeVpk/SiEreI
 vzUhr9kPTlmyHPaZR7Kb3d+LEIsQ2kSjQrc4PF2vE/7GpptIG21Zf/7sE2QaowPw3P92
 ajPM+2obO2sbcIyGtUYimwJiLv9mwnxe3HqEQZZp0Y5NVF1QG2Rc3paZmQANNLaAc/nW
 T3B2N4j8riqW7N0SRSFXqerP4iJ/hQs0PkUtsa8MZECGyq7z0QZKKpJ9kUGk/EO9QnOT
 w5Lsz9bneGR9mCjW71QwE2EpLTibVZao8sAYZatHIPTnNp9HTTOPYexZgSU1qY+xrlYN
 d4Og==
X-Gm-Message-State: AOAM530ay9Q28GGt+mky7HTB4ze9yGPytL+e500GE7zblvSiZK7N3s0N
 sbMuuCfFOnIAxa+GzTmZ2+Piyw==
X-Google-Smtp-Source: ABdhPJw1hH04X6jqzGEgnVz1sKejMmMcQ0ipIyr1BfrO+zQl6WQxh3eIowPTsCnosZrjz6q6h3DuGQ==
X-Received: by 2002:a62:ed01:0:b029:1c8:c6c:16f0 with SMTP id
 u1-20020a62ed010000b02901c80c6c16f0mr4642645pfh.80.1614126675570; 
 Tue, 23 Feb 2021 16:31:15 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id h5sm134895pgv.87.2021.02.23.16.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 16:31:15 -0800 (PST)
Subject: Re: [PATCH v2 2/2] target/riscv: Call check_access() before
 tcg_temp_new()
To: Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210222184940.43169-1-Alexander.Richardson@cl.cam.ac.uk>
 <20210222184940.43169-2-Alexander.Richardson@cl.cam.ac.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7725686f-fec7-5787-22e1-fe5be84c24a4@linaro.org>
Date: Tue, 23 Feb 2021 16:31:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222184940.43169-2-Alexander.Richardson@cl.cam.ac.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Wed, 24 Feb 2021 00:31:24 -0000

On 2/22/21 10:49 AM, Alex Richardson wrote:
> ---
>  target/riscv/insn_trans/trans_rvh.c.inc | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Any particular reason?

At first I thought this was a macro with a hidden return, but it isn't.  I
would understand a cleanup like

    if (check_access(ctx)) {
       TCGv t0 = tcg_temp_new();
       TCGv t1 = tcg_temp_new();
       ...

where we do not generate the rest of the code if we raised an exception.
Alternately, if the nesting seems ugly,

    if (!check_access(ctx)) {
        return true;
    }
    ...
    return true;


r~

