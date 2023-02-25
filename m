Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVsBQ-0003YR-9B
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 05:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVsBO-0003Ps-6x
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 05:53:38 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVsBL-0002ZC-Hf
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 05:53:37 -0500
Received: by mail-oi1-x22e.google.com with SMTP id y184so1478164oiy.8
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 02:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PGt9QBw4XnHFt0d57RuK9U3rgCsmbFpVhFiXaC1UJHk=;
 b=CJkPZnpgjGbNl4cJB61ZRY7H8C55IrolS5a9ybvAZtnCn2/4B2FbWGYcQUwjegOXgc
 JC928vxp/BgiCpoStYVHz68JlQuLGuKRAhAY9UGz6oJFVFGUmy8+yUkezetDxq8ubrSr
 sWDVsoxTbuheCRMYQ9HQCsoDIHEqOToIdeWGn6Qmvttz7udP/agS0S+9wqo+nbcP2AKV
 XkVn6Kp0OM4snXfUqXUdbRjj0CnAyI5z3B9M0TtTAlUyPDWrvSmA+g6h7sqA91ypSZcb
 cVH7FgoA8yqfzvszpfczPxpxrw/WTX8POlJaOEqYnUKAkba+4P03lFFZis0nBavo+PFb
 IZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PGt9QBw4XnHFt0d57RuK9U3rgCsmbFpVhFiXaC1UJHk=;
 b=EqGuxnPPiiEHd/UC3Owm74NdNUTRdsSPs3FWSZBYHB4kXIfKIfCOCm/xGFQfLBBjYY
 fQaJ2VRMbmLjNuhWeI914eYK6gdJhAlGbH479sCWiAYav7UBS/Xmt/32p51h0GRCu8cf
 u48V/LRrSBONhs7AUdcdHnYLFOW/am3FhYAeti3hQ/O8WA3uiyzqNAHHzvkdsWB0AG11
 /gCHhv7K7tWlsv4g/m6648NrVAeAVHOIR0LHc9E022IHJD4QZeR54JobLxvWNgQe/Qhr
 eYIRxmiARXSfG2UppldV2A/4qN8i/qREdUCr29/V+BtcxF+VIQSmIG/4gTWdbd6BYbKu
 IjAQ==
X-Gm-Message-State: AO0yUKUcCO2UD5fhq48nPRELrn4yL3wo8PhMBIOBAsfh5DXCwZYHFcW7
 avaj/ZueVO69aGeZh8KeJfA6tQ==
X-Google-Smtp-Source: AK7set9DL0D1IYOq5uAcEtYpf5bLiDhkQ2lIEnxjuyGFWtKNZFr70Z5SfdxVETnVbHtTdU/NgRIrQg==
X-Received: by 2002:aca:1108:0:b0:383:d3ae:1a5f with SMTP id
 8-20020aca1108000000b00383d3ae1a5fmr5173257oir.25.1677322413409; 
 Sat, 25 Feb 2023 02:53:33 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 q65-20020acaf244000000b00383e0bec93bsm754319oih.49.2023.02.25.02.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:53:32 -0800 (PST)
Message-ID: <35c80eef-d232-b7a3-0238-ce305d4cf6d7@ventanamicro.com>
Date: Sat, 25 Feb 2023 07:53:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 74/76] tracing: remove transform.py
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-75-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230225091427.1817156-75-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Feb 2023 10:53:38 -0000



On 2/25/23 06:14, Richard Henderson wrote:
> This file got left behind when the tcg stuff was
> removed from tracetool.
> 
> Fixes: 126d4123c50a ("tracing: excise the tcg related from tracetool")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   meson.build                    |   1 -
>   scripts/tracetool/transform.py | 168 ---------------------------------
>   2 files changed, 169 deletions(-)
>   delete mode 100644 scripts/tracetool/transform.py
> 
> diff --git a/meson.build b/meson.build
> index 6cb2b1a42f..275399b8c2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2861,7 +2861,6 @@ tracetool_depends = files(
>     'scripts/tracetool/format/log_stap.py',
>     'scripts/tracetool/format/stap.py',
>     'scripts/tracetool/__init__.py',
> -  'scripts/tracetool/transform.py',
>     'scripts/tracetool/vcpu.py'
>   )
>   
> diff --git a/scripts/tracetool/transform.py b/scripts/tracetool/transform.py
> deleted file mode 100644
> index ea8b27799d..0000000000
> --- a/scripts/tracetool/transform.py
> +++ /dev/null
> @@ -1,168 +0,0 @@
> -# -*- coding: utf-8 -*-
> -
> -"""
> -Type-transformation rules.
> -"""
> -
> -__author__     = "Lluís Vilanova <vilanova@ac.upc.edu>"
> -__copyright__  = "Copyright 2012-2016, Lluís Vilanova <vilanova@ac.upc.edu>"
> -__license__    = "GPL version 2 or (at your option) any later version"
> -
> -__maintainer__ = "Stefan Hajnoczi"
> -__email__      = "stefanha@redhat.com"
> -
> -
> -def _transform_type(type_, trans):
> -    if isinstance(trans, str):
> -        return trans
> -    elif isinstance(trans, dict):
> -        if type_ in trans:
> -            return _transform_type(type_, trans[type_])
> -        elif None in trans:
> -            return _transform_type(type_, trans[None])
> -        else:
> -            return type_
> -    elif callable(trans):
> -        return trans(type_)
> -    else:
> -        raise ValueError("Invalid type transformation rule: %s" % trans)
> -
> -
> -def transform_type(type_, *trans):
> -    """Return a new type transformed according to the given rules.
> -
> -    Applies each of the transformation rules in trans in order.
> -
> -    If an element of trans is a string, return it.
> -
> -    If an element of trans is a function, call it with type_ as its only
> -    argument.
> -
> -    If an element of trans is a dict, search type_ in its keys. If type_ is
> -    a key, use the value as a transformation rule for type_. Otherwise, if
> -    None is a key use the value as a transformation rule for type_.
> -
> -    Otherwise, return type_.
> -
> -    Parameters
> -    ----------
> -    type_ : str
> -        Type to transform.
> -    trans : list of function or dict
> -        Type transformation rules.
> -    """
> -    if len(trans) == 0:
> -        raise ValueError
> -    res = type_
> -    for t in trans:
> -        res = _transform_type(res, t)
> -    return res
> -
> -
> -##################################################
> -# tcg -> host
> -
> -def _tcg_2_host(type_):
> -    if type_ == "TCGv":
> -        # force a fixed-size type (target-independent)
> -        return "uint64_t"
> -    else:
> -        return type_
> -
> -TCG_2_HOST = {
> -    "TCGv_i32": "uint32_t",
> -    "TCGv_i64": "uint64_t",
> -    "TCGv_ptr": "void *",
> -    None: _tcg_2_host,
> -    }
> -
> -
> -##################################################
> -# host -> host compatible with tcg sizes
> -
> -HOST_2_TCG_COMPAT = {
> -    "uint8_t": "uint32_t",
> -    "uint16_t": "uint32_t",
> -    }
> -
> -
> -##################################################
> -# host/tcg -> tcg
> -
> -def _host_2_tcg(type_):
> -    if type_.startswith("TCGv"):
> -        return type_
> -    raise ValueError("Don't know how to translate '%s' into a TCG type\n" % type_)
> -
> -HOST_2_TCG = {
> -    "uint32_t": "TCGv_i32",
> -    "uint64_t": "TCGv_i64",
> -    "void *"  : "TCGv_ptr",
> -    "CPUArchState *": "TCGv_env",
> -    None: _host_2_tcg,
> -    }
> -
> -
> -##################################################
> -# tcg -> tcg helper definition
> -
> -def _tcg_2_helper_def(type_):
> -    if type_ == "TCGv":
> -        return "target_ulong"
> -    else:
> -        return type_
> -
> -TCG_2_TCG_HELPER_DEF = {
> -    "TCGv_i32": "uint32_t",
> -    "TCGv_i64": "uint64_t",
> -    "TCGv_ptr": "void *",
> -    None: _tcg_2_helper_def,
> -    }
> -
> -
> -##################################################
> -# tcg -> tcg helper declaration
> -
> -def _tcg_2_tcg_helper_decl_error(type_):
> -    raise ValueError("Don't know how to translate type '%s' into a TCG helper declaration type\n" % type_)
> -
> -TCG_2_TCG_HELPER_DECL = {
> -    "TCGv"    : "tl",
> -    "TCGv_ptr": "ptr",
> -    "TCGv_i32": "i32",
> -    "TCGv_i64": "i64",
> -    "TCGv_env": "env",
> -    None: _tcg_2_tcg_helper_decl_error,
> -    }
> -
> -
> -##################################################
> -# host/tcg -> tcg temporal constant allocation
> -
> -def _host_2_tcg_tmp_new(type_):
> -    if type_.startswith("TCGv"):
> -        return "tcg_temp_new_nop"
> -    raise ValueError("Don't know how to translate type '%s' into a TCG temporal allocation" % type_)
> -
> -HOST_2_TCG_TMP_NEW = {
> -    "uint32_t": "tcg_const_i32",
> -    "uint64_t": "tcg_const_i64",
> -    "void *"  : "tcg_const_ptr",
> -    None: _host_2_tcg_tmp_new,
> -    }
> -
> -
> -##################################################
> -# host/tcg -> tcg temporal constant deallocation
> -
> -def _host_2_tcg_tmp_free(type_):
> -    if type_.startswith("TCGv"):
> -        return "tcg_temp_free_nop"
> -    raise ValueError("Don't know how to translate type '%s' into a TCG temporal deallocation" % type_)
> -
> -HOST_2_TCG_TMP_FREE = {
> -    "uint32_t": "tcg_temp_free_i32",
> -    "uint64_t": "tcg_temp_free_i64",
> -    "void *"  : "tcg_temp_free_ptr",
> -    None: _host_2_tcg_tmp_free,
> -    }

