Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVsAF-00028V-VT
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 05:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVsAD-00026m-9m; Sat, 25 Feb 2023 05:52:25 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVsAB-0002Rp-5C; Sat, 25 Feb 2023 05:52:25 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 v17-20020a0568301bd100b0068dc615ee44so1008319ota.10; 
 Sat, 25 Feb 2023 02:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+8W46JPQ5XxKJ83X1locVUMEgFmUut4eVx1lFLv1GKk=;
 b=nHVrFP3hbEzSOqfRT2VsTCT/pFWNTKm6+sPkJQBIZuy2q+7GLs9RR9IfRwUvYE5DSk
 AZ7rPawxB/NFeuCK2HZvlX58+Plo5J1eKFb1WzLoJ54y0Yb1SXNGbMKteugVWDk4q6YW
 Mfsh75OUXr3C12/mP6CFUdkoDQoj+O0au0shEkhYi9Dsenf4rmEnMFWDgYbWKp0SJRh+
 UckMWO5NjEH4/TixtRM/o7OLohih5ONC+tHeicP8VhLd5LURInIwI1nk0QAwBiI+wY2i
 CnkyEKl5/G2+R7ZerBLFY6apBM0+Q4EdoSyHH4rlK/h5+6aan3yXrhy+KFJEJ7txM7Ko
 PXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+8W46JPQ5XxKJ83X1locVUMEgFmUut4eVx1lFLv1GKk=;
 b=KcE56GrQHRmKIqWWIu599+mOe5xUFnfHabvzL7R0ze5gc48cEYqRiuxrZo355ARUdq
 vs6KHvKpui0OM13xnbrotfCs8tPdf+CGvgMTOV4cskK7TC9p4GqQJ+Hb8dPfPHK5oto3
 O+hnULyzRr0AnfEIgh+8+xFijEFd+FwURB78Uhlts/iCGda533W9MHYel0ov4temDNGV
 qoN+0yjK7II5G08dmp0bwmDH8QpbfSefZ2jxxtP+uDwNb0pztQih+tVX+G7uawVXNDKP
 DR1W+jProNMRN9sgBqANusTWRgex1F/y5DtJbcWO7SiOXjtHrxuwbRuWcSzUVRK+93YX
 I7/Q==
X-Gm-Message-State: AO0yUKW5dgUS8yVXppmxSP07RkzF196Y9xt8Oo2zSC4Op+6rCDTYIFtF
 i4siSNKnGWfeXbqCdyREkN4=
X-Google-Smtp-Source: AK7set+0twpyAslTnT9Ug53HIIZwU0rO6M2eyo4lTbj/7ujRu2i98U+UW1A5ibnRKdQswKyEjixx7g==
X-Received: by 2002:a9d:161:0:b0:670:9115:946c with SMTP id
 88-20020a9d0161000000b006709115946cmr6434828otu.0.1677322340419; 
 Sat, 25 Feb 2023 02:52:20 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 l96-20020a9d1b69000000b0068bcadcad5bsm490103otl.57.2023.02.25.02.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:52:20 -0800 (PST)
Message-ID: <fa6854b1-01fe-165d-8db6-4bef53c09f8c@gmail.com>
Date: Sat, 25 Feb 2023 07:52:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 74/76] tracing: remove transform.py
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-75-richard.henderson@linaro.org>
 <c12cd821-59e5-36c3-0231-f81e3a4e1433@ventanamicro.com>
In-Reply-To: <c12cd821-59e5-36c3-0231-f81e3a4e1433@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 25 Feb 2023 10:52:26 -0000



On 2/25/23 07:22, Daniel Henrique Barboza wrote:
> Richard,
> 
> Not sure if I forgot or missed something but this patch breaks my build as follows:



Nevermind, just did it again to test the powerpc changes and it worked. I probably
goofed something the first time.



Daniel

> 
> $  make -j
>    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
> [1/885] Generating trace/trace-hw_hyperv.c with a custom command
> FAILED: trace/trace-hw_hyperv.c
> /usr/bin/python3 ../scripts/tracetool.py --backend=log --group=hw_hyperv --format=c /home/danielhb/work/qemu/hw/hyperv/trace-events trace/trace-hw_hyperv.c
> Traceback (most recent call last):
>    File "/home/danielhb/work/qemu/build/../scripts/tracetool.py", line 19, in <module>
>      from tracetool import error_write, out, out_open
>    File "/home/danielhb/work/qemu/scripts/tracetool/__init__.py", line 21, in <module>
>      import tracetool.transform
> ModuleNotFoundError: No module named 'tracetool.transform'
> 
> 
> It seems that tracetool.py is still referring transform. This fixes the build
> for me:
> 
> $ git diff
> diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
> index 5393c7fc5c..c361815bc1 100644
> --- a/scripts/tracetool/__init__.py
> +++ b/scripts/tracetool/__init__.py
> @@ -18,7 +18,6 @@
> 
>   import tracetool.format
>   import tracetool.backend
> -import tracetool.transform
> 
> 
>   def error_write(*lines):
> 
> 
> For reference I grabbed and built the whole series from patchew:
> 
> https://patchew.org/QEMU/20230225091427.1817156-1-richard.henderson@linaro.org/
> 
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> On 2/25/23 06:14, Richard Henderson wrote:
>> This file got left behind when the tcg stuff was
>> removed from tracetool.
>>
>> Fixes: 126d4123c50a ("tracing: excise the tcg related from tracetool")
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   meson.build                    |   1 -
>>   scripts/tracetool/transform.py | 168 ---------------------------------
>>   2 files changed, 169 deletions(-)
>>   delete mode 100644 scripts/tracetool/transform.py
>>
>> diff --git a/meson.build b/meson.build
>> index 6cb2b1a42f..275399b8c2 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -2861,7 +2861,6 @@ tracetool_depends = files(
>>     'scripts/tracetool/format/log_stap.py',
>>     'scripts/tracetool/format/stap.py',
>>     'scripts/tracetool/__init__.py',
>> -  'scripts/tracetool/transform.py',
>>     'scripts/tracetool/vcpu.py'
>>   )
>> diff --git a/scripts/tracetool/transform.py b/scripts/tracetool/transform.py
>> deleted file mode 100644
>> index ea8b27799d..0000000000
>> --- a/scripts/tracetool/transform.py
>> +++ /dev/null
>> @@ -1,168 +0,0 @@
>> -# -*- coding: utf-8 -*-
>> -
>> -"""
>> -Type-transformation rules.
>> -"""
>> -
>> -__author__     = "Lluís Vilanova <vilanova@ac.upc.edu>"
>> -__copyright__  = "Copyright 2012-2016, Lluís Vilanova <vilanova@ac.upc.edu>"
>> -__license__    = "GPL version 2 or (at your option) any later version"
>> -
>> -__maintainer__ = "Stefan Hajnoczi"
>> -__email__      = "stefanha@redhat.com"
>> -
>> -
>> -def _transform_type(type_, trans):
>> -    if isinstance(trans, str):
>> -        return trans
>> -    elif isinstance(trans, dict):
>> -        if type_ in trans:
>> -            return _transform_type(type_, trans[type_])
>> -        elif None in trans:
>> -            return _transform_type(type_, trans[None])
>> -        else:
>> -            return type_
>> -    elif callable(trans):
>> -        return trans(type_)
>> -    else:
>> -        raise ValueError("Invalid type transformation rule: %s" % trans)
>> -
>> -
>> -def transform_type(type_, *trans):
>> -    """Return a new type transformed according to the given rules.
>> -
>> -    Applies each of the transformation rules in trans in order.
>> -
>> -    If an element of trans is a string, return it.
>> -
>> -    If an element of trans is a function, call it with type_ as its only
>> -    argument.
>> -
>> -    If an element of trans is a dict, search type_ in its keys. If type_ is
>> -    a key, use the value as a transformation rule for type_. Otherwise, if
>> -    None is a key use the value as a transformation rule for type_.
>> -
>> -    Otherwise, return type_.
>> -
>> -    Parameters
>> -    ----------
>> -    type_ : str
>> -        Type to transform.
>> -    trans : list of function or dict
>> -        Type transformation rules.
>> -    """
>> -    if len(trans) == 0:
>> -        raise ValueError
>> -    res = type_
>> -    for t in trans:
>> -        res = _transform_type(res, t)
>> -    return res
>> -
>> -
>> -##################################################
>> -# tcg -> host
>> -
>> -def _tcg_2_host(type_):
>> -    if type_ == "TCGv":
>> -        # force a fixed-size type (target-independent)
>> -        return "uint64_t"
>> -    else:
>> -        return type_
>> -
>> -TCG_2_HOST = {
>> -    "TCGv_i32": "uint32_t",
>> -    "TCGv_i64": "uint64_t",
>> -    "TCGv_ptr": "void *",
>> -    None: _tcg_2_host,
>> -    }
>> -
>> -
>> -##################################################
>> -# host -> host compatible with tcg sizes
>> -
>> -HOST_2_TCG_COMPAT = {
>> -    "uint8_t": "uint32_t",
>> -    "uint16_t": "uint32_t",
>> -    }
>> -
>> -
>> -##################################################
>> -# host/tcg -> tcg
>> -
>> -def _host_2_tcg(type_):
>> -    if type_.startswith("TCGv"):
>> -        return type_
>> -    raise ValueError("Don't know how to translate '%s' into a TCG type\n" % type_)
>> -
>> -HOST_2_TCG = {
>> -    "uint32_t": "TCGv_i32",
>> -    "uint64_t": "TCGv_i64",
>> -    "void *"  : "TCGv_ptr",
>> -    "CPUArchState *": "TCGv_env",
>> -    None: _host_2_tcg,
>> -    }
>> -
>> -
>> -##################################################
>> -# tcg -> tcg helper definition
>> -
>> -def _tcg_2_helper_def(type_):
>> -    if type_ == "TCGv":
>> -        return "target_ulong"
>> -    else:
>> -        return type_
>> -
>> -TCG_2_TCG_HELPER_DEF = {
>> -    "TCGv_i32": "uint32_t",
>> -    "TCGv_i64": "uint64_t",
>> -    "TCGv_ptr": "void *",
>> -    None: _tcg_2_helper_def,
>> -    }
>> -
>> -
>> -##################################################
>> -# tcg -> tcg helper declaration
>> -
>> -def _tcg_2_tcg_helper_decl_error(type_):
>> -    raise ValueError("Don't know how to translate type '%s' into a TCG helper declaration type\n" % type_)
>> -
>> -TCG_2_TCG_HELPER_DECL = {
>> -    "TCGv"    : "tl",
>> -    "TCGv_ptr": "ptr",
>> -    "TCGv_i32": "i32",
>> -    "TCGv_i64": "i64",
>> -    "TCGv_env": "env",
>> -    None: _tcg_2_tcg_helper_decl_error,
>> -    }
>> -
>> -
>> -##################################################
>> -# host/tcg -> tcg temporal constant allocation
>> -
>> -def _host_2_tcg_tmp_new(type_):
>> -    if type_.startswith("TCGv"):
>> -        return "tcg_temp_new_nop"
>> -    raise ValueError("Don't know how to translate type '%s' into a TCG temporal allocation" % type_)
>> -
>> -HOST_2_TCG_TMP_NEW = {
>> -    "uint32_t": "tcg_const_i32",
>> -    "uint64_t": "tcg_const_i64",
>> -    "void *"  : "tcg_const_ptr",
>> -    None: _host_2_tcg_tmp_new,
>> -    }
>> -
>> -
>> -##################################################
>> -# host/tcg -> tcg temporal constant deallocation
>> -
>> -def _host_2_tcg_tmp_free(type_):
>> -    if type_.startswith("TCGv"):
>> -        return "tcg_temp_free_nop"
>> -    raise ValueError("Don't know how to translate type '%s' into a TCG temporal deallocation" % type_)
>> -
>> -HOST_2_TCG_TMP_FREE = {
>> -    "uint32_t": "tcg_temp_free_i32",
>> -    "uint64_t": "tcg_temp_free_i64",
>> -    "void *"  : "tcg_temp_free_ptr",
>> -    None: _host_2_tcg_tmp_free,
>> -    }
> 

