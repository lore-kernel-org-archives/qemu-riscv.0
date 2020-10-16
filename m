Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTTKy-0007NU-Tc
	for mharc-qemu-riscv@gnu.org; Fri, 16 Oct 2020 13:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTTKr-0007KZ-TB
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2020 13:16:09 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTTKp-000827-EI
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2020 13:16:09 -0400
Received: by mail-pg1-x542.google.com with SMTP id h6so1833486pgk.4
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2020 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3u22fuaUAC4emaWKLqxyzZ3iv7mrxTzsyPsdWnCshfA=;
 b=aAbj9O+e+hncOYXIE//uCEsIdUE/2v5mFQrinnTdWvP/VIz6qU5YdUAYjDi6c6/gyk
 MgwlTmHRcwJWgfdOKJcYnbgpATMB9kVhZDh7zlD1JNz+cSLaMs79HLh1A4CLpkDWwn4Q
 ksMNRH63PicW0NXlHEfLfcgk4On9P1J0LPUv+EpjNRvvfdf1sCKC0E03WtekALDymQVl
 8iItQ/7J6UNn70/e+TDIdc1yOW0LvHuecotarxQYhlOCxpzTE8hwbvvRoraZRhKuzm3h
 FG01PbZ7kU6e7eLTXRbg3L+NO8DRNeOU0RugcCmy2liRxS2kt/qTMgOpWc0qAQNbWjuB
 xk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3u22fuaUAC4emaWKLqxyzZ3iv7mrxTzsyPsdWnCshfA=;
 b=cb46T0aj6TO2si5XdD/+Yhv8L1eMluIgU160M3/XC6zbGjYZgvelaOKsr/CXz9Vcbh
 zecvyZ+Ld5IDAU+eyBi5KAHfHOxFYOQtlnfed0J/IupwYCluN3LQaFHvZ5mLAC3uz/Rr
 usPQuZODKIT+aomRx29OTo4/z//a9f7CcehRPjjGjzjzuDUlIb0T7nUsXdRjJ87L1bE8
 CHzyS+/ATUumoWzj5zO+hCoWuj7rIQNzjMIiH+RDntlQKWom70fqCrp5uKFT2nD/KuyR
 p03zFF5qfRkS0jjhxu2boC5PO9udO2Cp03X4TuR640eqVWBzuaCqVUSJc+RH/wu5oQqk
 kQcA==
X-Gm-Message-State: AOAM531fmJTTIFr+myW3vdo5rsZ/ZiyAWk7K4No5QAxNs8qpZWdb9NKB
 7Ls/Zj6Wwihgmm5Cu3ghgXosKw5ucgrBvQ==
X-Google-Smtp-Source: ABdhPJxxKpWWWX60mXIUMRNkSeF4LGHxgofXDwd5A+qMudQpjuTe/wtTsVg3+/SIYQ4ZMNeggCathw==
X-Received: by 2002:a63:1212:: with SMTP id h18mr3934041pgl.196.1602868565079; 
 Fri, 16 Oct 2020 10:16:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m4sm3317748pgv.87.2020.10.16.10.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 10:16:03 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] [RISCV_PM] Support CSRs required for RISC-V PM
 extension except for ones in hypervisor mode
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "space.monkey.delivers@gmail.com" <space.monkey.delivers@gmail.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20201015152139.28903-1-space.monkey.delivers@gmail.com>
 <20201015152139.28903-2-space.monkey.delivers@gmail.com>
 <d39e0c59-3b04-6401-aaac-8e202fb5036a@linaro.org>
 <CAFukJ-BwbtRyCYFW3+v4f8xmri3+Yk5ayhgZYen-6fj1xjmD9g@mail.gmail.com>
 <CAFukJ-AYk6VjC=8h83+Y==XbTwXODP34_JMzndW6_taD2uu4+g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65746626-278a-d380-7df6-4cd71366344a@linaro.org>
Date: Fri, 16 Oct 2020 10:16:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFukJ-AYk6VjC=8h83+Y==XbTwXODP34_JMzndW6_taD2uu4+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.253,
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
X-List-Received-Date: Fri, 16 Oct 2020 17:16:10 -0000

On 10/15/20 11:05 AM, Alexey Baturo wrote:
> Meanwhile, do you think applying **MTE *masks while reading CSR values is a
> good solution for now?

Yes.


r~

