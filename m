Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwqDQ-0002lI-EL
	for mharc-qemu-riscv@gnu.org; Sun, 11 Aug 2019 11:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50232)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hwqDO-0002ko-A9
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 11:57:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hwqDN-00037m-Eo
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 11:57:02 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42943)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hwqDN-00037J-9G
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 11:57:01 -0400
Received: by mail-pl1-x644.google.com with SMTP id ay6so46987948plb.9
 for <qemu-riscv@nongnu.org>; Sun, 11 Aug 2019 08:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZuWbFWmgqAWMkxfhGzv8L4uAtCYgdyk5OR0YxlBIJdY=;
 b=g2pbPQEbpC0WzU0q3m7fr8IC+/uURYHCF0xwXnvB/Q+bUtscZHFz0gBqowg4nP+eGA
 IgBDFFy6bYDiLdRz/7yBcR2xYbxzeC0yJdJIwkRNHWUFFuPvvy6zo5Q1Lnzr0wHszko9
 TwbmCSVfPJaEa3lxiSApJGAvFCRu12r54zCPeQ7NLTOCmhKJMkekmnfU/wlI5/yoloRV
 jSZamQoImKOH88bx2NV825/EcvLmXRAWSCw/fzig5pqmDZNu4Q7gY/GQf5o6uj99+iED
 yerfAJdRD7f1P0RovMnL3WPJ15DWV4v9zlxSDcGoHdvF3Y/ZFIdJHKfsdlozMnIaAVxi
 qpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:cc:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZuWbFWmgqAWMkxfhGzv8L4uAtCYgdyk5OR0YxlBIJdY=;
 b=oNgPB4bU2B20nxyZoZw2GeL7vnSlTbuRc/JuYR4JgfP4PK0meMow7dybP5z5bob1q0
 wY1Q826TPbZQQ5SIXr6wKbF9S7HRQKU7dWbxszK+TeH7Fjcweqaa9dxWAvNjHHs4j2L+
 4IZ8jYDq+dfSGIW3A8THPnrUUE1GGtyMyQX4o9eG/rrGAA+qavpwdqbFM/H3V73gFL7r
 9Q6FiqISsu0/Tgc4csJ/VgIVo/gvWUqPFoRwRF8Sq/WjLs9cBuLyR8783OYhgloTo22d
 SUZ67MRLmyiLZoKgszMeongdbZm0eLNc1THkZBg8KOV9S2HQfU12vS71suyEkwCG4I0J
 6gmA==
X-Gm-Message-State: APjAAAX/G+d0UT3PBtXNH+vVaiVGouMNR1mw146Iuay3C0HdlDVjf4Ur
 6llndkMYV/WVbrqQVXDAIk81ig==
X-Google-Smtp-Source: APXvYqwcls2XdF8sJqjtoXbLyUr/Q/tQEPdElt83CN1DWDCCb6C8zrMck1IGneklTSxQ0c7DaDiCpw==
X-Received: by 2002:a17:902:6847:: with SMTP id
 f7mr28466996pln.311.1565539019990; 
 Sun, 11 Aug 2019 08:56:59 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v14sm110684082pfm.164.2019.08.11.08.56.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Aug 2019 08:56:58 -0700 (PDT)
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
 <1565510821-3927-6-git-send-email-bmeng.cn@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Cc: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <27a965a8-59fd-b1f0-d73c-16dcb844c3fc@linaro.org>
Date: Sun, 11 Aug 2019 08:56:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565510821-3927-6-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 05/28] riscv: hart: Support
 heterogeneous harts population
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
X-List-Received-Date: Sun, 11 Aug 2019 15:57:03 -0000

On 8/11/19 1:06 AM, Bin Meng wrote:
> +        /* heterogeneous harts */
> +        while (tmp_type) {
> +            if (n >= s->num_harts) {
> +                break;
> +            }
> +            riscv_hart_realize(s, n++, tmp_type, errp);
> +            last_type = tmp_type;
> +            tmp_type = strtok(NULL, ",");
> +        }

You need to create clusters for each cpu type.

In particular, E51 does not have the fpu that U54 does, and so we need to
generate different code for each cluster.

Because each cluster generates different TBs, you'll minimize code generation
if you do more than just create one per cpu, e.g. pop these cpu type names into
a GHashTable as you create each cluster.

The only other example of clusters in tree is hw/arm/armsse.c.  Note that board
has one cpu per cluster, as each cpu may be configured differently via other
property settings.


r~

