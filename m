Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nU8ed-0000QI-VT
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 11:00:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nU8eb-0000Pb-QR; Tue, 15 Mar 2022 11:00:05 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:35378 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nU8eY-0004Gp-Ky; Tue, 15 Mar 2022 11:00:05 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAD3_NjmqTBi+CqQAw--.54635S2;
 Tue, 15 Mar 2022 22:59:51 +0800 (CST)
Subject: Re: [PATCH 1/2] target/riscv: cpu: Fixup indentation
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
References: <20220315064007.3600746-1-alistair.francis@opensource.wdc.com>
 <20220315064007.3600746-2-alistair.francis@opensource.wdc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <f3e03984-6e44-4e44-b644-61b72ae4a690@iscas.ac.cn>
Date: Tue, 15 Mar 2022 22:59:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220315064007.3600746-2-alistair.francis@opensource.wdc.com>
Content-Type: multipart/alternative;
 boundary="------------9B4381D7D23E5E871EA66B3C"
Content-Language: en-US
X-CM-TRANSID: zQCowAD3_NjmqTBi+CqQAw--.54635S2
X-Coremail-Antispam: 1UD129KBjvdXoWrurW7CFyDJF47Xr1UtFWxCrg_yoWkZwc_Ga
 4IgFZrW3y7Jr40vrWUua18trn3Ga95Wrn2gws7ta1rGry7Ww1rAan7JF18Zr1fuay5CF9a
 vryxGrW3Cw18tjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbyAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2
 jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II
 8E6IAqYI8I648v4I1lFcxC0VAYjxAxZF0Ew4CEw7xC0wACY4xI67k04243AVC20s07Mx8G
 jcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij2
 8IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr
 1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JwCE64xvF2IEb7IF0Fy7YxBIdaVFxhVjvjDU
 0xZFpf9x0JUySoJUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 15 Mar 2022 15:00:06 -0000

This is a multi-part message in MIME format.
--------------9B4381D7D23E5E871EA66B3C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alistair,

It seems that there is other indentation problem in  cpu.c. Maybe they 
can be fixed together.

/* Do some ISA extension error checking */
if(cpu->cfg.ext_i&& cpu->cfg.ext_e) {
error_setg(errp,
"I and E extensions are incompatible");
return;
}
if(!cpu->cfg.ext_i&& !cpu->cfg.ext_e) {
error_setg(errp,
"Either I or E extension must be set");
return;
}

Regards,

Weiwei Li

在 2022/3/15 下午2:40, Alistair Francis 写道:
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddda4906ff..a4120c7fb4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -709,11 +709,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>           case IRQ_S_EXT:
>           case IRQ_VS_EXT:
>           case IRQ_M_EXT:
> -             if (kvm_enabled()) {
> +            if (kvm_enabled()) {
>                   kvm_riscv_set_irq(cpu, irq, level);
> -             } else {
> +            } else {
>                   riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
> -             }
> +            }
>                break;
>           default:
>               g_assert_not_reached();

--------------9B4381D7D23E5E871EA66B3C
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNv
bnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5Pgog
ICAgPHA+SGkgQWxpc3RhaXIsPC9wPgogICAgPHA+SXQgc2VlbXMgdGhhdCB0aGVyZSBpcyBv
dGhlciBpbmRlbnRhdGlvbiBwcm9ibGVtIGluwqAgY3B1LmMuwqAKICAgICAgTWF5YmUgdGhl
eSBjYW4gYmUgZml4ZWQgdG9nZXRoZXIuPC9wPgogICAgPHA+PC9wPgogICAgPHA+PC9wPgog
ICAgPGRpdiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7YmFja2dyb3VuZC1jb2xvcjogI2ZmZmZm
Zjtmb250LWZhbWlseTogJ0Ryb2lkIFNhbnMgTW9ubycsICdtb25vc3BhY2UnLCBtb25vc3Bh
Y2UsICdEcm9pZCBTYW5zIEZhbGxiYWNrJztmb250LXdlaWdodDogbm9ybWFsO2ZvbnQtc2l6
ZTogMThweDtsaW5lLWhlaWdodDogMjRweDt3aGl0ZS1zcGFjZTogcHJlOyI+PGRpdj48c3Bh
biBzdHlsZT0iY29sb3I6ICMwMDAwMDA7Ij4gICAgICAgIDwvc3Bhbj48c3BhbiBzdHlsZT0i
Y29sb3I6ICMwMDgwMDA7Ij4vKiBEbyBzb21lIElTQSBleHRlbnNpb24gZXJyb3IgY2hlY2tp
bmcgKi88L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7Ij4g
ICAgICAgIDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICNhZjAwZGI7Ij5pZjwvc3Bhbj48
c3BhbiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7Ij4gKDwvc3Bhbj48c3BhbiBzdHlsZT0iY29s
b3I6ICMwMDEwODA7Ij5jcHU8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAwMDAwOyI+
LSZndDs8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAxMDgwOyI+Y2ZnPC9zcGFuPjxz
cGFuIHN0eWxlPSJjb2xvcjogIzAwMDAwMDsiPi48L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9y
OiAjMDAxMDgwOyI+ZXh0X2k8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAwMDAwOyI+
ICZhbXA7JmFtcDsgPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogIzAwMTA4MDsiPmNwdTwv
c3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7Ij4tJmd0Ozwvc3Bhbj48c3BhbiBz
dHlsZT0iY29sb3I6ICMwMDEwODA7Ij5jZmc8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAj
MDAwMDAwOyI+Ljwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICMwMDEwODA7Ij5leHRfZTwv
c3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7Ij4pIHs8L3NwYW4+PC9kaXY+PGRp
dj48c3BhbiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7Ij4gICAgICAgICAgICA8L3NwYW4+PHNw
YW4gc3R5bGU9ImNvbG9yOiAjMDAwMGZmOyI+ZXJyb3Jfc2V0Zzwvc3Bhbj48c3BhbiBzdHls
ZT0iY29sb3I6ICMwMDAwMDA7Ij4oPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogIzAwMTA4
MDsiPmVycnA8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAwMDAwOyI+LDwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJjb2xvcjogIzAwMDAwMDsiPiAgICAgICAgICAgICAg
ICAgICAgICAgPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogI2EzMTUxNTsiPiJJIGFuZCBF
IGV4dGVuc2lvbnMgYXJlIGluY29tcGF0aWJsZSI8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9y
OiAjMDAwMDAwOyI+KTs8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6ICMw
MDAwMDA7Ij4gICAgICAgICAgICAgICAgICAgICAgIDwvc3Bhbj48c3BhbiBzdHlsZT0iY29s
b3I6ICNhZjAwZGI7Ij5yZXR1cm48L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAwMDAw
OyI+Ozwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJjb2xvcjogIzAwMDAwMDsiPiAg
ICAgICB9PC9zcGFuPjwvZGl2Pgo8ZGl2PjxzcGFuIHN0eWxlPSJjb2xvcjogIzAwMDAwMDsi
PiAgICAgICAgPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogI2FmMDBkYjsiPmlmPC9zcGFu
PjxzcGFuIHN0eWxlPSJjb2xvcjogIzAwMDAwMDsiPiAoITwvc3Bhbj48c3BhbiBzdHlsZT0i
Y29sb3I6ICMwMDEwODA7Ij5jcHU8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAwMDAw
OyI+LSZndDs8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAxMDgwOyI+Y2ZnPC9zcGFu
PjxzcGFuIHN0eWxlPSJjb2xvcjogIzAwMDAwMDsiPi48L3NwYW4+PHNwYW4gc3R5bGU9ImNv
bG9yOiAjMDAxMDgwOyI+ZXh0X2k8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAwMDAw
OyI+ICZhbXA7JmFtcDsgITwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICMwMDEwODA7Ij5j
cHU8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAwMDAwOyI+LSZndDs8L3NwYW4+PHNw
YW4gc3R5bGU9ImNvbG9yOiAjMDAxMDgwOyI+Y2ZnPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xv
cjogIzAwMDAwMDsiPi48L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAxMDgwOyI+ZXh0
X2U8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAwMDAwOyI+KSB7PC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiAjMDAwMDAwOyI+ICAgICAgICAgICAgPC9zcGFu
PjxzcGFuIHN0eWxlPSJjb2xvcjogIzAwMDBmZjsiPmVycm9yX3NldGc8L3NwYW4+PHNwYW4g
c3R5bGU9ImNvbG9yOiAjMDAwMDAwOyI+KDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICMw
MDEwODA7Ij5lcnJwPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogIzAwMDAwMDsiPiw8L3Nw
YW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7Ij4gICAgICAgICAg
ICAgICAgICAgICAgIDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICNhMzE1MTU7Ij4iRWl0
aGVyIEkgb3IgRSBleHRlbnNpb24gbXVzdCBiZSBzZXQiPC9zcGFuPjxzcGFuIHN0eWxlPSJj
b2xvcjogIzAwMDAwMDsiPik7PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9y
OiAjMDAwMDAwOyI+ICAgICAgICAgICAgICAgICAgICAgICA8L3NwYW4+PHNwYW4gc3R5bGU9
ImNvbG9yOiAjYWYwMGRiOyI+cmV0dXJuPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogIzAw
MDAwMDsiPjs8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7
Ij4gICAgICAgfTwvc3Bhbj48L2Rpdj48L2Rpdj4KICAgIDxwPlJlZ2FyZHMsPC9wPgogICAg
PHA+V2Vpd2VpIExpPGJyPgogICAgPC9wPgogICAgPGRpdiBzdHlsZT0iY29sb3I6ICMwMDAw
MDA7YmFja2dyb3VuZC1jb2xvcjogI2ZmZmZmZjtmb250LWZhbWlseTogJ0Ryb2lkIFNhbnMg
TW9ubycsICdtb25vc3BhY2UnLCBtb25vc3BhY2UsICdEcm9pZCBTYW5zIEZhbGxiYWNrJztm
b250LXdlaWdodDogbm9ybWFsO2ZvbnQtc2l6ZTogMThweDtsaW5lLWhlaWdodDogMjRweDt3
aGl0ZS1zcGFjZTogcHJlOyI+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6ICMwMDAwMDA7Ij4K
PC9zcGFuPjwvZGl2PjwvZGl2PgogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij7l
nKggMjAyMi8zLzE1IOS4i+WNiDI6NDAsIEFsaXN0YWlyIEZyYW5jaXMKICAgICAg5YaZ6YGT
Ojxicj4KICAgIDwvZGl2PgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKICAgICAgY2l0
ZT0ibWlkOjIwMjIwMzE1MDY0MDA3LjM2MDA3NDYtMi1hbGlzdGFpci5mcmFuY2lzQG9wZW5z
b3VyY2Uud2RjLmNvbSI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9
IiI+RnJvbTogQWxpc3RhaXIgRnJhbmNpcyA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIz
OTZFIiBocmVmPSJtYWlsdG86YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tIj4mbHQ7YWxpc3Rh
aXIuZnJhbmNpc0B3ZGMuY29tJmd0OzwvYT4KClNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZy
YW5jaXMgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmFs
aXN0YWlyLmZyYW5jaXNAd2RjLmNvbSI+Jmx0O2FsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbSZn
dDs8L2E+Ci0tLQogdGFyZ2V0L3Jpc2N2L2NwdS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFy
Z2V0L3Jpc2N2L2NwdS5jIGIvdGFyZ2V0L3Jpc2N2L2NwdS5jCmluZGV4IGRkZGE0OTA2ZmYu
LmE0MTIwYzdmYjQgMTAwNjQ0Ci0tLSBhL3RhcmdldC9yaXNjdi9jcHUuYworKysgYi90YXJn
ZXQvcmlzY3YvY3B1LmMKQEAgLTcwOSwxMSArNzA5LDExIEBAIHN0YXRpYyB2b2lkIHJpc2N2
X2NwdV9zZXRfaXJxKHZvaWQgKm9wYXF1ZSwgaW50IGlycSwgaW50IGxldmVsKQogICAgICAg
ICBjYXNlIElSUV9TX0VYVDoKICAgICAgICAgY2FzZSBJUlFfVlNfRVhUOgogICAgICAgICBj
YXNlIElSUV9NX0VYVDoKLSAgICAgICAgICAgICBpZiAoa3ZtX2VuYWJsZWQoKSkgeworICAg
ICAgICAgICAgaWYgKGt2bV9lbmFibGVkKCkpIHsKICAgICAgICAgICAgICAgICBrdm1fcmlz
Y3Zfc2V0X2lycShjcHUsIGlycSwgbGV2ZWwpOwotICAgICAgICAgICAgIH0gZWxzZSB7Cisg
ICAgICAgICAgICB9IGVsc2UgewogICAgICAgICAgICAgICAgIHJpc2N2X2NwdV91cGRhdGVf
bWlwKGNwdSwgMSAmbHQ7Jmx0OyBpcnEsIEJPT0xfVE9fTUFTSyhsZXZlbCkpOwotICAgICAg
ICAgICAgIH0KKyAgICAgICAgICAgIH0KICAgICAgICAgICAgICBicmVhazsKICAgICAgICAg
ZGVmYXVsdDoKICAgICAgICAgICAgIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCk7CjwvcHJlPgog
ICAgPC9ibG9ja3F1b3RlPgogIDwvYm9keT4KPC9odG1sPgo=
--------------9B4381D7D23E5E871EA66B3C--


